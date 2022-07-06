//When a new Account is created it should check for duplicated based on Name,Phone,Address 
//If duplicate records are found then throw error message. 
//If No duplicate records are found then create account record. 
//Note:-  Along with trigger write Test class. 
 
public class ContactDuplication
{
	public static void ErrorDisplay(list<Contact> cclist)
    {
        set<id> contactids = new set<id>();
        for(contact c:cclist)
        {
			contactids.add(c.LastName);
        }
        list<Contact> conlist =[select id,lastname from contact where id=:contactids];
        for(Contact c:conlist)
        {
			if(conlist.size()>0)
            {
                system.debug('already the name was existed');
            }
            else
            {	contact cc = new contact();
                insert cc;
            }
        }
	}
}