using System.Data;
using api.models;
using api.repository.repositories;
using Dapper.FastCrud;
using DotNet.Testcontainers.Builders;
using DotNet.Testcontainers.Containers;
using FluentAssertions;
using Npgsql;
using Testcontainers.PostgreSql;

public class CompanyRepositoryTests : IAsyncLifetime
{
    private readonly PostgreSqlContainer _pgContainer;
    private IDbConnection _dbConnection = default!;
    private CompanyRepository _repository = default!;

    public CompanyRepositoryTests()
    {
        _pgContainer = new PostgreSqlBuilder()
            .WithDatabase("testdb")
            .WithUsername("testuser")
            .WithPassword("testpass")
            .Build();
    }

    public async Task InitializeAsync()
    {
        await _pgContainer.StartAsync();

        _dbConnection = new NpgsqlConnection(_pgContainer.GetConnectionString());
        _dbConnection.Open();

        // Set up FastCrud for PostgreSQL
        OrmConfiguration.DefaultDialect = SqlDialect.PostgreSql;
        OrmConfiguration.RegisterEntity<Company>()
            .SetTableName("company")
            .SetProperty(c => c.Id, prop => prop.SetDatabaseColumnName("id").SetPrimaryKey())
            .SetProperty(c => c.Name, prop => prop.SetDatabaseColumnName("name"))
            .SetProperty(c => c.Exchange, prop => prop.SetDatabaseColumnName("exchange"))
            .SetProperty(c => c.Ticker, prop => prop.SetDatabaseColumnName("ticker"))
            .SetProperty(c => c.Isin, prop => prop.SetDatabaseColumnName("isin"))
            .SetProperty(c => c.Website, prop => prop.SetDatabaseColumnName("website"));

        // Create table
        using var cmd = _dbConnection.CreateCommand();
        cmd.CommandText = @"
            CREATE EXTENSION IF NOT EXISTS pgcrypto;
            CREATE TABLE company (
                id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                name TEXT NOT NULL,
                exchange TEXT NOT NULL,
                ticker TEXT NOT NULL,
                isin VARCHAR NOT NULL UNIQUE,
                website TEXT
            );";
        cmd.ExecuteNonQuery();

        _repository = new CompanyRepository(_dbConnection);
    }

    public async Task DisposeAsync()
    {
        await _pgContainer.DisposeAsync();
        _dbConnection?.Dispose();
    }

    [Fact]
    public async Task CreateAndGetCompany_WorksCorrectly()
    {
        var newCompany = new Company
        {
            Id = Guid.NewGuid(),
            Name = "Test Co",
            Ticker = "TST",
            Exchange = "NYSE",
            Isin = "IE0000000002",
            Website = "https://test.com"
        };

        await _repository.CreateCompanyAsync(newCompany);

        var fetched = await _repository.GetCompanyById(newCompany.Id.ToString());
        fetched.Should().NotBeNull();
        fetched!.Name.Should().Be("Test Co");
    }

    [Fact]
    public async Task GetCompanyByIsin_WorksCorrectly()
    {
        var company = new Company
        {
            Id = Guid.NewGuid(),
            Name = "ISIN Co",
            Ticker = "ISI",
            Exchange = "NASDAQ",
            Isin = "IE0000000003",
            Website = "https://isin.com"
        };

        await _repository.CreateCompanyAsync(company);
        var result = await _repository.GetCompanyByIsinAsync(company.Isin);

        result.Should().NotBeNull();
        result!.Exchange.Should().Be("NASDAQ");
    }

    [Fact]
    public async Task UpdateCompany_WorksCorrectly()
    {
        var company = new Company
        {
            Id = Guid.NewGuid(),
            Name = "Original",
            Ticker = "ORG",
            Exchange = "LSE",
            Isin = "IE0000000004",
            Website = "https://original.com"
        };

        await _repository.CreateCompanyAsync(company);

        company.Name = "Updated";
        var updated = await _repository.UpdateCompanyAsync(company.Id.ToString(), company);

        updated.Name.Should().Be("Updated");
    }

    [Fact]
    public async Task DeleteCompany_WorksCorrectly()
    {
        var company = new Company
        {
            Id = Guid.NewGuid(),
            Name = "ToDelete",
            Ticker = "DEL",
            Exchange = "TSX",
            Isin = "IE0000000005",
            Website = "https://delete.com"
        };

        await _repository.CreateCompanyAsync(company);
        await _repository.DeleteCompanyAsync(company.Id.ToString());

        var result = await _repository.GetCompanyById(company.Id.ToString());
        result.Should().BeNull();
    }

    [Fact]
    public async Task GetCompanies_ReturnsAll()
    {
        await _repository.CreateCompanyAsync(new Company
        {
            Id = Guid.NewGuid(),
            Name = "Company1",
            Ticker = "C1",
            Exchange = "NYSE",
            Isin = "IE0000000006",
            Website = string.Empty
        });

        await _repository.CreateCompanyAsync(new Company
        {
            Id = Guid.NewGuid(),
            Name = "Company2",
            Ticker = "C2",
            Exchange = "NASDAQ",
            Isin = "IE0000000007",
            Website = string.Empty
        });

        var all = await _repository.GetCompaniesAsync();
        all.Should().HaveCountGreaterThanOrEqualTo(2);
    }
}