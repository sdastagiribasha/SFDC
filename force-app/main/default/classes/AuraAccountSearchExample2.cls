//How to Pass Parameters in ApexController Method to JavaScript
public class AuraAccountSearchExample2
{
    @AuraEnabled
    public static list<Account> getacclist(string industry)
    {
        string query='select id,name,phone from Account where industry=\''+industry+'\'';
        list<Account> accounts =Database.query(query);
        return accounts;
    }
}