namespace api.repository.repositories;
using Microsoft.Extensions.Configuration;
using interfaces;
using Npgsql;

public class CompanyRepositoryFactory(IConfiguration config) : ICompanyRepositoryFactory
{
    static CompanyRepositoryFactory()
    {
        DapperConfig.Configure();
    }

    public ICompanyRepository Create()
    {
        var conn = new NpgsqlConnection(config.GetConnectionString("DefaultConnection"));
        conn.Open();
        return new CompanyRepository(conn);
    }

    public async ValueTask<ICompanyRepository> CreateAsync()
    {
        var conn = new NpgsqlConnection(config.GetConnectionString("DefaultConnection"));
        await conn.OpenAsync();
        return new CompanyRepository(conn);
    }
}