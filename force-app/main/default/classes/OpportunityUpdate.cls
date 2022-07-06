//Update no of Opportunities like when ever inserting the first record i want value as 0 and next one more time create 
//then i need value 2 like this ....
public class OpportunityUpdate
{
    public void recordUpdate(list<opportunity> opplist)
    {
        list<id> accountids = new list<id>();
        for(opportunity o: opplist)
        {
            accountids.add(o.AccountId);
        }
        list<Account> acclist =[select id,name,No_of_opportunity__c,(select id,name,closedate,stagename from Opportunities) from Account where id in:accountids];
        //list<Account> acc = new list<Account>();
        /*for(integer i=0;i<=acclist.size();i++)
        {
            Account a = new Account();
            a.No_of_opportunity__c=a.opportunities.size();
            acc.add(a);
        }*/
        for(Account a:acclist)
        {
            if(a.No_of_opportunity__c==Null)
            {
                a.No_of_opportunity__c=0;
            }
            else
            {
                a.No_of_opportunity__c=a.No_of_opportunity__c+1;
            }
        }
        update acclist;
    }
}