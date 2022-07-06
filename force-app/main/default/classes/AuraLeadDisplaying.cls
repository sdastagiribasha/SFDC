//How to display the list of Lead records
public class AuraLeadDisplaying 
{
	@AuraEnabled
    public static list<Account> getAccounts()
    {
        list<Account> acclist =[select id,name,industry from Account];
        return acclist;
    }
}