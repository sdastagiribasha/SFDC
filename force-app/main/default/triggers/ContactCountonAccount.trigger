trigger ContactCountonAccount on Contact (after insert)
{
    //need to write trigger on contact object
    //first we need to get the contacts related accountids
    //we need to querry for Account object to get the list of Accountids with related contacts list
    //update the account field(no_Of_contacts) with count.
    list<id> accountids = new list<id>();
    for(Contact c:Trigger.New)
    {
      accountids.add(c.AccountId);  
    }
    list<Account> acclist =[select id,name,(select id,lastname,firstname from contacts)from Account where id=:accountids];
    for(Account a:acclist)
    {
        a.No_Of_Contacts__c=a.contacts.size();
    }
    update acclist;
    system.debug('no of contacts list with Account:'+acclist);
    
}