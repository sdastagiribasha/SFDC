//How to Pass Parameters in ApexController Method to JavaScript
public class AuraAccountSearchExample 
{
    @AuraEnabled
	public static list<Account> getAcclist(string industry)
    {
        string query ='select id,name,Phone,industry from Account where industry=\''+industry+'\'';
        list<Account> accounts =Database.query(query);
        return accounts;
    }
}