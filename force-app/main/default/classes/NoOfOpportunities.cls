//count no of Opportunities and store in account record
public class NoOfOpportunities
{
	public  static void showRecords(list<Opportunity> opp)
    {
       list<id> Accountids = new list<id>();
       for(opportunity o:opp)
       {
           Accountids.add(o.AccountId);
       }
       list<Account> acc1 = new list<Account>();
       list<Account> acc = [select name,No_of_opportunity__c,(select name from opportunities) from Account where id=:Accountids];
       for(Account a: acc)
       {
           a.No_of_opportunity__c = a.opportunities.size();
           acc1.add(a);
       }
        update acc1;
    }
}