namespace api.repository.interfaces;

public interface ICompanyRepositoryFactory
{
    ICompanyRepository Create();

    ValueTask<ICompanyRepository> CreateAsync();
}