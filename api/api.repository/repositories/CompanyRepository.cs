using System.Text.RegularExpressions;

namespace api.repository.repositories;
using interfaces;
using models;
using System.Data;
using Dapper.FastCrud;

public class CompanyRepository(IDbConnection db) : ICompanyRepository, IDisposable, IAsyncDisposable
{
    private readonly IDbConnection _db = db ?? throw new ArgumentNullException(nameof(db));

    public async Task<IEnumerable<Company>> GetCompaniesAsync()
    {
        return await _db.FindAsync<Company>();
    }

    public async Task<Company?> GetCompanyByIdAsync(string isin)
    {
        return await _db.GetAsync(new Company { Isin = isin });
    }

    public async Task<Company?> GetCompanyById(string id)
    {
        if (!Guid.TryParse(id, out var guid))
        {
            return null;
        }

        return await _db.GetAsync(new Company { Id = guid });
    }

    public async Task<Company?> GetCompanyByIsinAsync(string isin)
    {
        var companies = await _db.FindAsync<Company>(statement => statement
            .Where($"{nameof(Company.Isin):C} = @isin")
            .WithParameters(new { isin }));

        return companies.FirstOrDefault();
    }

    public async Task<Company?> CreateCompanyAsync(Company? company)
    {
        if (string.IsNullOrWhiteSpace(company?.Name) ||
            string.IsNullOrWhiteSpace(company.Ticker) ||
            string.IsNullOrWhiteSpace(company.Exchange) ||
            string.IsNullOrWhiteSpace(company.Isin))
        {
            return null;
        }

        if (!Regex.IsMatch(company.Isin, @"^[A-Z]{2}", RegexOptions.IgnoreCase))
        {
            return null;
        }

        var existing = await GetCompanyByIsinAsync(company.Isin);
        if (existing is not null)
        {
            return null;
        }

        company.Id = Guid.NewGuid();
        await _db.InsertAsync(company);

        return company;
    }

    public async Task<Company> UpdateCompanyAsync(string id, Company company)
    {
        if (!Guid.TryParse(id, out var guid))
        {
            throw new ArgumentException("Invalid GUID format", nameof(id));
        }

        company.Id = guid;
        await _db.UpdateAsync(company);
        return company;
    }

    public async Task DeleteCompanyAsync(string id)
    {
        if (!Guid.TryParse(id, out var guid))
        {
            throw new ArgumentException("Invalid GUID format", nameof(id));
        }

        var company = new Company { Id = guid };
        await _db.DeleteAsync(company);
    }

    public void Dispose() => _db.Dispose();

    public async ValueTask DisposeAsync()
    {
        if (_db is IAsyncDisposable dbAsyncDisposable)
        {
            await dbAsyncDisposable.DisposeAsync();
        }
        else
        {
            _db.Dispose();
        }
    }
}