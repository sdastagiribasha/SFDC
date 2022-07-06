//Update number of opportunities to account object after creating a new opportunity to account as related opportunity
public class UpdateOpportunities 
{
	public static void updateOpportunityCount(list<Opportunity> opplist)
    {
        list<id> accountids = new list<id>();
        for(opportunity o: opplist)
        {
            accountids.add(o.AccountId);
        }
        list<Account> acc = new list<Account>();
        list<Account> acclist =[select id,name,(select name,stagename from opportunities) from Account];
        for(Account a: acclist)
        {
            a.No_of_opportunity__c=a.opportunities.size();
            acc.add(a);
        }
        update acc;
	}
}