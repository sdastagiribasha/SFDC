trigger noOpportunitiesupdatedTrigger on Opportunity (after insert)
{
    list<id> accountids = new list<id>();
    for(opportunity o:Trigger.new)
    {
        accountids.add(o.AccountId);
    }
    list<Account> acclist = [select id,No_of_opportunity__c,(select id,name,closedate,stagename from opportunities)from Account];
    list<Account> acc = new list<Account>();
    for(Account a: acclist)
    {
        a.No_of_opportunity__c=a.opportunities.size();
        acc.add(a);
    }
    update acc;
    system.debug('no of opportunties in Account:'+acc);
}