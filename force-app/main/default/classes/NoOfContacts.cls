//Count number of contacts and store in account record
public class NoOfContacts 
{
	public static void countingContacts(list<contact> con)
    {
         list<id> accountids = new list<id>();
        for(contact c: con)
        {
            accountids.add(c.AccountId);
        }
        list<Account> account = new list<Account>();
        list<Account> acc = [select name,(select lastname from contacts) from Account where id=:accountids];
        for(Account a:acc)
        {
            a.No_Of_Contacts__c=a.contacts.size();
            account.add(a);
        }
        update account;
    }
}