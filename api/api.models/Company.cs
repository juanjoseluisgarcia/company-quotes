namespace api.models;

public class Company
{
    public  Guid Id { get; set; }
    public  string Name { get; set; }
    public  string Exchange { get; set; }
    public  string Ticker { get; set; }
    public  string Isin { get; set; }
    public  string Website { get; set; }
}