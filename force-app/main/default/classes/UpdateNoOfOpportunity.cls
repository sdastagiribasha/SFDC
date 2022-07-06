//Update number of opportunity to account object after creating new opportunity 
public class UpdateNoOfOpportunity 
{
	public static void noOfOpportunities(list<Opportunity> opplist)
    {
        list<Id> accountids = new list<Id>();
        for(opportunity o :opplist)
        {
            accountids.add(o.AccountId);
        }
        list<Account> acclist =[select id,No_of_opportunity__c,(select id,closedate from Opportunities) from Account 
                                where id in : accountids];
        list<Account> acc = new list<Account>();
        for(Account a: acclist)
        {
            a.No_of_opportunity__c=a.opportunities.size();
            acc.add(a);
        }
        update acc;
    }
}