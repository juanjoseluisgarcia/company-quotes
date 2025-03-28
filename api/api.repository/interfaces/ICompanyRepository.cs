namespace api.repository.interfaces;
using models;

public interface ICompanyRepository : IAsyncDisposable
{
    public Task<IEnumerable<Company>> GetCompaniesAsync();

    public Task<Company?> GetCompanyByIdAsync(string isin);

    public Task<Company?> GetCompanyById(string id);

    public Task<Company?> GetCompanyByIsinAsync(string isin);

    public Task<Company?> CreateCompanyAsync(Company? company);

    public Task<Company> UpdateCompanyAsync(string id, Company company);

    public Task DeleteCompanyAsync(string id);
}