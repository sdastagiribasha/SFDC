// Whenever new Account is created with Industry as EDUCATION and RATING as Warm. 
// Then create new opportunity with Opportunity name as account name and other details. 
public class TriggerInsertExample2 
{
	public static void creatingopportunity(list<Account> acc)
    {
        list<opportunity> listofOpportunity = new list<opportunity>();
        for(Account a:acc)
        {
            if(a.Industry=='Education' && a.Rating=='Warm')
            {
				opportunity op= new opportunity();
                op.Name='Ashraf';
                op.CloseDate=System.today()+15;
                op.StageName='Prospecting';
                listofOpportunity.add(op);
            }
        }
        insert listofOpportunity;
    }
}