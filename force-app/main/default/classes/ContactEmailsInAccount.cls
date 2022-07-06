//Create a custom field in Account object 'Contact_Email__c' which is long text area type. 
//And populate it from all the child contacts email  by comma saprated using Map instead of nested for loop.

public class ContactEmailsInAccount 
{
public static void displayEmail(list<contact> contactlist)
{
    list<id> accountids = new list<id>();
    for(contact c1: contactlist)
    {
        accountids.add(c1.AccountId);
        system.debug(accountids);
    } 
    list<Account> accountlist =[select id,name,Contact_Email__c,(select id,lastname,CMail__C from contacts) from Account where Id=:accountids];
    
    /*
    Map<id,Integer> count = new Map<id,Integer>();
    
    for(Account a1:accountlist)
    {
        count.put(a1.id,a1.Contacts.size());
        system.debug(count);
    }
    */
    list<Account> acc1 = new list<Account>();

    for(Account a2:accountlist)
    {
        //a2.Contact_Email__c='';
        for(Contact c1:contactlist)
        {
            if (c1.CMail__c==True)
            {
             system.debug('value of contact Emails:'+a2.Contact_Email__c);
             a2.Contact_Email__c+=','+c1.Email;
             acc1.add(a2);
            }
        }
    }
    update acc1;
    system.debug(acc1);
}
}