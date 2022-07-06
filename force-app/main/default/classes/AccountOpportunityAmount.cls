//Create a field on Account called “is_gold”, checkbox, default off
//When an Opportunity is greater than $20k, mark is_gold to TRUE
public class AccountOpportunityAmount
{
  //public static Boolean updated = False;
  public static void updateAmount(list<Opportunity> opportunitylist)
  {
      list<id> accountids = new list<id>();
      for(Opportunity c1: opportunitylist)
      {
          if(c1.Amount>20000)
          {
           	accountids.add(c1.Accountid);
         	 system.debug(accountids);
          }
          else
          {
              //accountids.add(c1.Accountid);
			  //updated=false;             
          }
          
      }
      list<Account> accountlist =[select is_gold__c,(select Amount from opportunities) from Account where id in:accountids];
      system.debug(accountlist);
      list<Account> acc1 = new list<Account>();
      for(Account a: accountlist)
      {
          a.Is_Gold__c=True;
          acc1.add(a);
      }
      update acc1;
      system.debug(acc1);
  }
}