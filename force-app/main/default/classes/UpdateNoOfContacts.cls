//Update number of contacts to account object after adding a contact to account as related contact
public class UpdateNoOfContacts
{
	public  static void countContacts(list<contact> con)
    {
        list<id> accountids = new list<id>();
        for(Contact c: con)
        {
            accountids.add(c.AccountId);
        }
        list<Account> acc = [select No_Of_Contacts__c,(select lastName from Contacts) from Account];
        for(Account a: acc)
        {
            a.No_Of_Contacts__c=a.contacts.size();
        }
        update acc;
    }
}