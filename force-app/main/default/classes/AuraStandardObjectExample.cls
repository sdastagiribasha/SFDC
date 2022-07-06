//How to use an attribute of type standard object in a lightning component?
public class AuraStandardObjectExample 
{
	@AuraEnabled
    public static list<Account> getacclist()
    {
        list<Account> acclist =[select id,name,phone,industry from Account];
        return acclist;
    }
}