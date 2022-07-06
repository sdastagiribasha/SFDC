//Whenever an opportunity is deleted corresponding Accounts and contacts should be deleted. 
public class OppDeletedCoresponding
{
	public static void deleteCoresponding(list<Opportunity> opp)
    {
        list<Opportunity> opplist =[select id,name,closedate,stagename from opportunity];
        for(Opportunity o: opp)
        {
            
        }
    }
}