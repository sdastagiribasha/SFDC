//List of all accounts with inputs as the rating and industry as input (input can be a list) 
//and also show related contacts and opportunities
public class ListOfAllAccountExample 
{
	public static void displayrecords(list<String> ind,list<string> rat)
    {
        list<Account> acc = [select name,industry,rating,(select lastname,firstname from contacts),(select name,stagename from opportunities)from Account where industry=:ind and rating =:rat];
        system.debug(acc);
    }
}