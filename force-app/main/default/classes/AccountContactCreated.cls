//create account and contact in apex
public class AccountContactCreated 
{    
    public static  void display()
    {
        list<Account> account = new list<Account>();
        account a = new Account();
        a.Name='Ashraf';
        a.Phone='87654';
        account.add(a);
        insert account;
        system.debug(account);
        list<contact> con = new list<contact>();
        contact c = new contact();
        c.LastName='Raj';
        c.FirstName='shaik';
        con.add(c);
        insert con;
        system.debug(con);
    }
}