//How to display The List of Account Records related to logged in User
public class AccountRecordsDisplaying 
{
    @AuraEnabled
    public static list<Account> getaccounts()
    {
        list<Account> acclist =[select id,name,industry,phone from Account where Ownerid=:userinfo.getUserId()];
        return acclist;
    }
    
    @AuraEnabled
    public static list<Account> getAccountSearching(string searchingkey)
    {
        string name = + searchingkey + '%';
       list<Account> acclist =[select id,name,industry,phone from Account where name like : name];
        return acclist; 
    }
}