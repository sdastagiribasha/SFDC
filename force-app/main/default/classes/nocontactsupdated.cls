//Update number of contacts to account object after adding a contact to account as related contact
public class nocontactsupdated
{
	public static void updateContacts(list<contact> conlist)
    {
        list<id> accountids = new list<id>();
        for(contact c: conlist)
        {
            accountids.add(c.AccountId);
        }
        list<Account> acclist =[select id,No_Of_Contacts__c,(select id,lastname from contacts) from Account where id=:accountids];
        list<Account> acc = new list<Account>();
        for(Account a: acclist)
        {
            a.No_Of_Contacts__c=a.contacts.size();
            acc.add(a);
        }
        update acc;
        system.debug('no of contacts updated:'+acc);
    }
}