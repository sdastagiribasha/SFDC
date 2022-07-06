public class CreateObject
{
	public static Lead mylead;
    
    public static void methodCalling()
    {
        //lead mylead = new Lead();
        mylead = new Lead();
        mylead.LastName='Todaylead';
        mylead.Company='Codyssey';
        insert mylead;
    }
}