//When a new Account is created it should check for duplicated based on Name,Phone,Address 
//If duplicate records are found then throw error message. 
//If No duplicate records are found then create account record. 
//Note:-  Along with trigger write Test class. 
 
public class AccountDuplicate 
{
    public list<Account> acclsit;
    public Account acc;
	public static void duplicateNotAllowed(list<Account> accTrigger)
    {
       set<id> accountids = new set<id>();
       for(Account a:accTrigger)
       {
           accountids.add(a.id);
       }
       list<Account> account =[select id,name,phone from Account where id=:accountids];
       for(Account a: account)
       {
           if(account.size()>0)
           {
               system.debug('Account cant be Duplicated');
           }
           else
           {
              account = new list<Account>();
              insert account;
           }
       }
        
    }
}