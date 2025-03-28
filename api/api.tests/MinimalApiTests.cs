// File: ApiTests/MinimalApiTests.cs
using System.Net;
using System.Net.Http.Json;
using api.models;
using FluentAssertions;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Testing;

public class MinimalApiTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public MinimalApiTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.WithWebHostBuilder(builder =>
        {
            builder.UseEnvironment("Testing");
        }).CreateClient();
    }

    [Fact]
    public async Task Login_ReturnsToken()
    {
        var response = await _client.PostAsync("/login", null);
        response.StatusCode.Should().Be(HttpStatusCode.OK);

        var result = await response.Content.ReadFromJsonAsync<Dictionary<string, string>>();
        result.Should().ContainKey("token");
        result!["token"].Should().NotBeNullOrWhiteSpace();
    }

    [Fact]
    public async Task GetCompanies_Unauthorized_WhenNoToken()
    {
        var response = await _client.GetAsync("/api/companies");
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }

    [Fact]
    public async Task GetCompanyById_Unauthorized_WhenNoToken()
    {
        var response = await _client.GetAsync("/api/companies/123");
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }

    [Fact]
    public async Task CreateCompany_Unauthorized_WhenNoToken()
    {
        var company = new Company
        {
            Name = "TestCo",
            Ticker = "TCO",
            Exchange = "NYSE",
            Isin = "IE0000000001",
            Website = "https://testco.com"
        };

        var response = await _client.PostAsJsonAsync("/api/companies", company);
        response.StatusCode.Should().Be(HttpStatusCode.Unauthorized);
    }
}