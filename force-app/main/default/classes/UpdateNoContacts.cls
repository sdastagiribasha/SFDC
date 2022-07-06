//Update number of contacts to account object after adding a contact to account as related contact
public class UpdateNoContacts
{
	public static void displayContact(list<Contact> conlist, list<Contact> conlistold)
   //public static void displayContact(list<Contact> conlist, list<Contact> conlistold,Map<id,contact> conlistnewmap, Map<id,contact> conlistoldmap)
    {
        set<id> accountids = new set<id>();
        for(Contact c:conlist)
        {
            if(string.isNotBlank(c.AccountId)) {
                accountids.add(c.AccountId);
            }
           
        }
        for(contact c1: conlistold) {
            if(string.isNotBlank(c1.AccountId)) {
                accountids.add(c1.AccountId);
            } 
            
        }
        /*
        for(contact c2: conlistnewmap) {
            accountids.add(c2.Accountid);
        }
        
        for(contact c3: conlistoldmap) {
            accountids.add(c3.conlistoldmap);
        }
        */
        list<Account> acclist =[SELECT id,name,No_Of_Contacts__c,(SELECT id,lastname FROM contacts) FROM Account WHERE id IN :accountids];
        list<Account> acc = new list<Account>();
        if(!acclist.isEmpty()) {
        for(Account a : acclist)
        {
            a.No_Of_Contacts__c=a.contacts.size();
            acc.add(a);
        }
        update acclist;
    }
    }
        
}