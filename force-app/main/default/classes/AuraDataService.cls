//how to pass the Dynamic parameters in javascript
//Here We are Going to Use Lightning Data Service(LDS) for Without Going to the Server side
public class AuraDataService 
{
	@AuraEnabled
    public static list<Account> getAccounts(string accindustry)
    {
        list<Account> acclist = [select id,name,phone,industry from Account where industry =:accindustry];
        return acclist;
    }
}