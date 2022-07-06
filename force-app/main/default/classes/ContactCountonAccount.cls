//write a trigger to update contact count in Account, where contacts are morethan 10
public class ContactCountonAccount 
{
	public void displaycontactcount(List<contact> conlist)
    {
        
        list<id>accountids = new list<id>();
        for(contact c:conlist)
        {
        	accountids.add(c.AccountId);
            system.debug('no oc accountids:'+accountids);
        }
        list<Account> acclist =[select id,name,No_Of_Contacts__c,(select id,lastname,firstname from contacts) from Account where id=:accountids];
        for(Account a: acclist)
        {
            a.No_Of_Contacts__c=a.contacts.size();
        }
        update acclist;
        system.debug('no of contacts list in Account:'+acclist);
    }
}