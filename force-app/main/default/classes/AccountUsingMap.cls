//when ever a Account phone number is modified, update all the contacts of the Account.
//contacts otherphone as old phone no of Account.
//contacts mobilephone as new phone no of Account.
public class AccountUsingMap 
{
	public static void accountPhone(Map<id,Account> oldmap, Map<id,Account> newmap)
    {
        list<Id> accountids = new list<id>();
        for(Id key : oldmap.keyset())
        {
            Account old = oldmap.get(key);
            Account newacc = newmap.get(key);
            if(old.Phone!=newacc.Phone)
            {
               accountids.add(key);
            }
        }
        list<contact> contactlist = [select id,lastname,firstname,otherphone,mobilephone,AccountId from contact where AccountId in:accountids];
        for(contact c: contactlist)
        {
            c.OtherPhone=oldmap.get(c.AccountId).phone;
            c.MobilePhone=newmap.get(c.AccountId).phone;
        }
        update contactlist;
        system.debug('contacts mobile,otherphone updated'+contactlist);
    }
}