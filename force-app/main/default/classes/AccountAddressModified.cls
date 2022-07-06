//Create a field on Account called “Out_of_Zip”, checkbox, default off
//When a Billing Address is modified, get the new Postal Code. Then check which Contacts on the Account are outside that Postal Code.
// If 1 or more Contacts are outside of the Postal Code, mark Out_of_Zip as TRUE.

public class AccountAddressModified 
{
    public static Boolean Updated = False;
    public static void accountBillingAddress(list<Account> acclist)
    {
        list<id> accountids = new list<id>();
        for(Account a:acclist)
        {
            accountids.add(a.id);  
            System.debug(accountids);
        }
        
        list<Account> acc =[select BillingPostalCode,(select MailingPostalCode  from contacts) from Account where Id in: accountids];
        List<Account> addlist =  new List<Account>();
        system.debug(acc);
        for(Account a1:acc)
        {
            if(a1.BillingPostalCode!=Null)
            {
                list<contact> conlist = a1.contacts;
                system.debug(conlist);
                Integer count=0;
                for(contact c: conlist)
                {                    
                    if(c.MailingPostalCode !=a1.BillingPostalCode)
                    {
                        count=count+1;                        
                    }
                }
                system.debug('count values:'+count);
                if(count>1)
                {
                    a1.Out_Of_Zip__c=true;
                    addlist.add(a1);
                }                
            }
        }
        Updated=True; 
		update addlist;
        //system.debug(addlist);
    }
    
}