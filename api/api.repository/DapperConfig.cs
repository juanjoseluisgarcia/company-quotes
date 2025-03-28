namespace api.repository;

using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using models;
using Dapper.FastCrud;
using Npgsql;

public class DapperConfig
{
    private static bool _configured;

    public static void Configure()
    {
        if (_configured)
        {
            return;
        }

        _configured = true;

        OrmConfiguration.DefaultDialect = SqlDialect.PostgreSql;
        OrmConfiguration.RegisterEntity<Company>()
            .SetTableName("company")
            .SetProperty(x => x.Id, prop => prop
                .SetDatabaseColumnName("id")
                .SetPrimaryKey()
                .SetDatabaseGenerated(DatabaseGeneratedOption.Identity))
            .SetProperty(x => x.Name, prop => prop.SetDatabaseColumnName("name"))
            .SetProperty(x => x.Exchange, prop => prop.SetDatabaseColumnName("exchange"))
            .SetProperty(x => x.Ticker, prop => prop.SetDatabaseColumnName("ticker"))
            .SetProperty(x => x.Isin, prop => prop.SetDatabaseColumnName("isin"))
            .SetProperty(x => x.Website, prop => prop.SetDatabaseColumnName("website"));
    }

    public static IDbConnection CreateConnection(string connectionString)
    {
        return new NpgsqlConnection(connectionString);
    }
}