public class CustomCheckboxcopydata 
{
	public static void display(list<opportunity> opplist)
    {
        set<id> accountids = new set<id>();
        for(opportunity o : opplist)
        {
            if(o.copydata__c==false)
            {
               accountids.add(o.accountid);
                system.debug('copied data'+accountids);
            }
        }
        list<Account> acclist =[select id,name,(select id,name,copydata__c from opportunities) from Account where id=:accountids];
    }
}