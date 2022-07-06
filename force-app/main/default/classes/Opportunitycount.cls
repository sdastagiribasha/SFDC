// counting no of employes based on opportunity stages records in account object.
public class Opportunitycount
{
	public static void lisofcounts(list<opportunity>opp)
    {
        set<id> accountids = new set<id>();
        for(opportunity o:opp)
        {
            accountids.add(o.Accountid);
        }
        list<sobject> oblist=[select StageName,Accountid,count(id)ids from opportunity 
                              where Accountid in :accountids group by stageName,Accountid];
        Map<string,integer> mp = new Map<string,integer>();
        for(sobject s:oblist)
        {
            mp.put((string)s.get('Accountid')+s.get('stagename'),integer.valueOf(s.get('ids')));
        }
        list<Account> acc=[select name,Prospectingcount__c from Account where id in:accountids];
        list<Account> listofaccounts = new list<Account>();
        for(Account a:acc)
        {
            a.Prospectingcount__c=mp.get(a.id+'Prospecting');
            listofaccounts.add(a);
        }
        update listofaccounts;
    } 
}