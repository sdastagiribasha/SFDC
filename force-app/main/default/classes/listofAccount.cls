//List of all accounts with inputs as the rating and industry as input (input can be a list)
public class listofAccount
{
	public static void recorddisplay(list<string> ind,list<string> rat)
    {
         list<Account> acc = [select name,phone,industry,rating from Account where industry=:ind and rating=:rat];
        	system.debug(acc);
    }
}