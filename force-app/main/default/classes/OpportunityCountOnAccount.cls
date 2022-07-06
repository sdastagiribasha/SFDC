//update the no of opportunitys count in Account
public class OpportunityCountOnAccount 
{
    public static void updateCount(list<opportunity> opp)
    {
        list<id> accountids = new list<id>();
        for(opportunity o:opp)
        {
            accountids.add(o.AccountId); 
        }
        list<Account> acc =[select name,No_of_opportunity__c,(select name from opportunities) from Account where id in :accountids];
        list<Account> acc1= new list<Account>();
        for(Account a: acc)
        {
            a.No_of_opportunity__c=a.opportunities.size();
            acc1.add(a);
        }
        update acc1;
     }
}