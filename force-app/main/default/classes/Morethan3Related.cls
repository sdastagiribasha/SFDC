//Check for number of related contacts for an account. If there are more than 3 related contacts raise exception
public class Morethan3Related 
{
    public static void updateContacts(list<contact> conlist)
    {
        list<id> accountids = new list<id>();
        for(contact c: conlist)
        {
            accountids.add(c.AccountId);
        }
        list<Account> acclist = [select id,No_Of_Contacts__c,(select id,lastname from contacts) from Account where id=:accountids];
        list<contact> cclist = new list<contact>();
        for(Account a: acclist)
        {
            for(contact cl1 : a.contacts)
            {
                cclist.add(cl1);
            }
        }
        for(contact cl2 : conlist)
        {
            if(cclist.size()>3)
            {
                cl2.addError('you cant create morethan 3 contacts for an Account object');
                system.debug(cl2);
            }
        }
    }
}