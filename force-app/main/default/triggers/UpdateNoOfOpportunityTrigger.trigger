trigger UpdateNoOfOpportunityTrigger on Opportunity (after insert)
{
    list<id> accountids = new list<id>();
    for(opportunity o:Trigger.new)
    {
        accountids.add(o.AccountId);
    }
    list<Account> acclist = [select id,name,No_of_opportunity__c,(select name from Opportunities) from Account where id in:accountids];
    list<Account> acc = new list<Account>();
    for(Account a: acclist)
    {
       a.No_of_opportunity__c=a.opportunities.size();
       acc.add(a);
    }
    update acc;
}