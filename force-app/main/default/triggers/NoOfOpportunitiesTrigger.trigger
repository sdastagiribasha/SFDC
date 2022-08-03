trigger NoOfOpportunitiesTrigger on Opportunity (before insert,before update,before delete,after insert,after update,after delete)
{
    /*
    if(Trigger.IsAfter && Trigger.IsInsert)
    {
        NoOfOpportunities.showRecords(Trigger.New);
    }
    */
    list<id> accountids = new list<id>();
    for(opportunity o : Trigger.new)
    {
        accountids.add(o.AccountId);
    }
    list<Account> acc = new list<Account>();
    list<Account> acc1 =[select name,No_of_opportunity__c,(select name from opportunities) from Account where id=:Accountids];
    for(Account a:acc1)
    {
        a.No_of_opportunity__c =a.opportunities.size();
        acc.add(a);
    }
    update acc;
}