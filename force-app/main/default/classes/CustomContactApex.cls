//Custom related list Lightning Components for specific related list for creating a record, view all records.
public class CustomContactApex
{
	@AuraEnabled
    public static list<Contact> getAllContacts(string accid)
    {
        list<Contact> contacts = new list<Contact>();
        list<Contact> conlist =[select id,lastname,title,firstname,email,phone from contact where Accountid=:accid];
        for(Contact c: conlist)
        {
           contacts.add(c); 
        }
        return contacts;
    }
}