//Create custom Checkbox field Active in Account object. By default, active should be checked.
//Add one more value ‘Invalid’ to opportunity picklist.
//If Account is made inactive by  unchecking active field, opportunity picklist values should be assigned to ‘Invalid’ 
//and probability should be changed to ‘0’. This should happen for all the opportunities under that account.
//Use Trigger to do this. 

public class CustomCheckBox
{
	public static void display(list<Account> acc)
    {
        set<id> accountids = new set<id>();
        for(Account a:acc)
        {
         if(a.Optin__c==false)
         {
             accountids.add(a.id);
             system.debug('Account of ids:'+accountids);
         }
        }
        list<opportunity> opplist =[select name,StageName,closedate from opportunity where Accountid in: accountids];
        for(opportunity o:opplist)
        {
            o.StageName='Invalid';
            o.Probability=0;
        }
        update opplist;
        system.debug(opplist);
    }
}