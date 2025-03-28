
    using api.models;
    #pragma warning disable SA1200
    using System.IdentityModel.Tokens.Jwt;
    using System.Security.Claims;
    using api.repository.interfaces;
    using api.repository.repositories;
    using Microsoft.AspNetCore.Authentication.JwtBearer;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.IdentityModel.Tokens;
    using Microsoft.OpenApi.Models;
    #pragma warning restore SA1200

    // Add services to the container.
    // Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
    var environment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT") ?? "Production";

    var builder = WebApplication.CreateBuilder(new WebApplicationOptions
    {
        Args = args,
        EnvironmentName = environment
    });

    builder.Configuration
        .SetBasePath(Directory.GetCurrentDirectory())
        .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
        .AddJsonFile($"appsettings.{environment}.json", optional: true, reloadOnChange: true)
        .AddEnvironmentVariables();

    builder.WebHost.UseUrls("http://0.0.0.0:3000");

    builder.Services.AddEndpointsApiExplorer();

    builder.Services.AddSwaggerGen(options =>
    {
        options.SwaggerDoc("v1", new OpenApiInfo { Title = "Company API", Version = "v1" });

        options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
        {
            Name = "Authorization",
            Type = SecuritySchemeType.Http,
            Scheme = "Bearer",
            BearerFormat = "JWT",
            In = ParameterLocation.Header,
            Description = "Enter: **Bearer &lt;your_token&gt;**"
        });

        options.AddSecurityRequirement(new OpenApiSecurityRequirement
        {
            {
                new OpenApiSecurityScheme
                {
                    Reference = new OpenApiReference
                    {
                        Type = ReferenceType.SecurityScheme,
                        Id = "Bearer"
                    }
                },
                Array.Empty<string>()
            }
        });
    });

    var key = "z93jf02j#fkl23fjasl%209fdj@#fj23!fjsklajdf"u8.ToArray();

    builder.Services.AddAuthentication(options =>
        {
            options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
            options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        })
        .AddJwtBearer(options =>
        {
            options.RequireHttpsMetadata = false;
            options.SaveToken = true;
            options.TokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = false,
                ValidateAudience = false
            };
        });

    builder.Services.AddAuthorization();

    builder.Services.AddSingleton<ICompanyRepositoryFactory, CompanyRepositoryFactory>();

    builder.Services.AddCors(options =>
    {
        options.AddPolicy("AllowAll", policy =>
        {
            policy
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader();
        });
    });

    var app = builder.Build();

    app.UseCors("AllowAll");

    app.UseSwagger();

    app.UseSwaggerUI();

    if (!app.Environment.IsEnvironment("Testing") && !app.Environment.IsEnvironment("Docker"))
    {
        app.UseHttpsRedirection();
    }

    app.UseAuthentication();

    app.UseAuthorization();

    app.MapPost("/login", () =>
    {
        var username = "demo";
        var role = "Admin";

        var tokenHandler = new JwtSecurityTokenHandler();
        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity([
                new Claim(ClaimTypes.Name, username),
                new Claim(ClaimTypes.Role, role)
            ]),
            Expires = DateTime.UtcNow.AddHours(1),
            SigningCredentials = new SigningCredentials(
                new SymmetricSecurityKey(key),
                SecurityAlgorithms.HmacSha256Signature)
        };

        var token = tokenHandler.CreateToken(tokenDescriptor);
        var jwt = tokenHandler.WriteToken(token);

        return Results.Ok(new { token = jwt });
    }).WithOpenApi(operation => new OpenApiOperation(operation)
    {
        Summary = "Retrieves a JWT token for authentication",
        Description = "For testing purposed only - no real authentication",
        Tags = new List<OpenApiTag> { new() { Name = "Login" } }
    });;


    app.MapGet("/api/companies", async ([FromServices] ICompanyRepositoryFactory factory) =>
        {
            await using var repo = await factory.CreateAsync();
            return Results.Ok(await repo.GetCompaniesAsync());
        }).RequireAuthorization()
        .WithName("companies")
        .WithOpenApi(operation => new OpenApiOperation(operation)
        {
            Summary = "Get all the companies",
            Description = "Fetches all the companies from the database.",
            Tags = new List<OpenApiTag> { new() { Name = "Companies" } }
        });

    app.MapGet("/api/companies/{id}", async ([FromServices] ICompanyRepositoryFactory factory, string id) =>
    {
        await using var repo = await factory.CreateAsync();
        var company = await repo.GetCompanyById(id);
        return company is not null ? Results.Ok(company) : Results.NotFound();
    }).RequireAuthorization()
        .WithName("company")
        .WithOpenApi(operation => new OpenApiOperation(operation)
        {
            Summary = "Get a company by ID",
            Description = "Fetches the company details for a specific ID.",
            Tags = new List<OpenApiTag> { new() { Name = "Companies" } }
        });

    app.MapGet("/api/companies/isin/{isin}", async ([FromServices] ICompanyRepositoryFactory factory, string isin) =>
        {
            await using var repo = await factory.CreateAsync();
            var company = await repo.GetCompanyByIsinAsync(isin);
            return company is not null ? Results.Ok(company) : Results.NotFound();
        }).RequireAuthorization()
        .WithName("companyByIsin")
        .WithOpenApi(operation => new OpenApiOperation(operation)
        {
            Summary = "Get a company by ISIN",
            Description = "Fetches the company details for a specific ISIN.",
            Tags = new List<OpenApiTag> { new() { Name = "Companies" } }
        });

    app.MapPut("/api/companies/{id}", async (
            [FromServices] ICompanyRepositoryFactory factory,
            string id,
            Company input) =>
        {
            await using var repo = await factory.CreateAsync();
            var updated = await repo.UpdateCompanyAsync(id, input);
            return Results.Ok(updated);
        })
        .RequireAuthorization()
        .WithName("updateCompany")
        .WithOpenApi(operation => new OpenApiOperation(operation)
        {
            Summary = "Updates a company",
            Description = "Updates a company with a specific ID.",
            Tags = new List<OpenApiTag> { new() { Name = "Companies" } }
        });


    app.MapPost("/api/companies", async ([FromServices] ICompanyRepositoryFactory factory, Company input) =>
        {
            await using var repo = await factory.CreateAsync();
            var created = await repo.CreateCompanyAsync(input);

            return created is not null
                ? Results.Created($"/api/companies/{created.Id}", created)
                : Results.BadRequest("Invalid input or ISIN already exists");
        })
        .RequireAuthorization()
        .WithName("createCompany")
        .WithOpenApi(operation => new OpenApiOperation(operation)
        {
            Summary = "Creates a company",
            Description = "Creates a company and assigns it a new ID.",
            Tags = new List<OpenApiTag> { new() { Name = "Companies" } }
        });

    app.Run();

    public partial class Program {}
