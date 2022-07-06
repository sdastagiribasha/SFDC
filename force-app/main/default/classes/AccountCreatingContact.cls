//Create a field on Account called “Only_Default_Contact”, checkbox, default off
//When a new Account is created, create a new Contact that has the following data points:
//First Name = “Info”
//Last Name = “Default”
//Email = “info@websitedomain.tld”
//Only_Default_Contact = TRUE
//When the Account has more than 1 Contact, update Only_Default_Contact to FALSE.

public class AccountCreatingContact
{
    public static void creatingContact(list<Account> acclist)
    {
        list<contact> cc = new list<Contact>();
        for(Account a: acclist)
        {
            contact c = new contact();
            c.AccountId=a.id;
            c.FirstName='Info';
            c.LastName=a.Name;
            c.Email='info@websitedomain.tld';
            cc.add(c);
        }
        insert cc;    
    }
    
    public static void contact2(list<contact> con2)
    {
        list<id> accountids = new list<id>();
       for(contact c2:con2)
       {
           accountids.add(c2.AccountId);
       }
       list<Account> acc1 =[select Only_Default_Contact__c,(select lastname from contacts) from Account where id in: accountids];
        for(Account a:acc1)
        {
            //Getting the all contacts and converted in to list
            list<contact> con=a.contacts;
            //list of contacts can converted into Integers(typecasting) 
            integer c2=integer.valueOf(con.size());
            system.debug(c2);
            if(c2>1)
            { 
                a.Only_Default_Contact__c=false;																																																							
                
            }
        }
        update acc1;
    }
}