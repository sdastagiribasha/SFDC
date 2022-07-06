//Create a field on Contact called Profile, text, 255
//When an Account is updated and the Website is filled in, update all the Profile field on all Contacts to:
//Profile = Website + ‘/’ + First Letter of First Name + Last Name
public class AccountContactProfile
{
    public static void updateProfile(list<Account> accountlist)
    {
        list<id> accountids = new list<id>();
        for(Account a1: accountlist)
        {
            accountids.add(a1.id);
            system.debug(accountids);
        }
        list<Account> acc =[select website,(select FirstName,LastName,Profile__c from contacts) from Account where id in:accountids];
        system.debug(acc);
        list<contact> conlist = new list<contact>();
        for(Account a2: acc)
        {
            if(a2.Website!=Null)
            {
                
                for(contact c1:a2.contacts)
                {
                   c1.AccountId=a2.id;
                   if(c1.Profile__c==''|| c1.Profile__c==Null)	
                   {
                     c1.Profile__c=a2.Website+'/'+c1.FirstName.substring(0,1)+c1.LastName;
                     system.debug('contact list:'+c1);
                     conlist.add(c1);
                   }    
                }
               
            }
           
         } 
        system.debug(conlist);
        update conlist;
        
    }
}