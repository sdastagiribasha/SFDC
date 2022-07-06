// Whenever new account is created with industry as banking then set ownership as private.
public class TriggerInsertExample 
{
	public static void updateAccount(list<Account> accn)
    {
        list<account> acc=new list<account>();
        for(Account a:accn)
        {
           if(a.Industry=='Banking')
           {
               a.Ownership= 'Private';
               acc.add(a);
           }
           
        } update acc;
    }
}