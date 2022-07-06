// Create a List of Account , Read all the existing Accounts and display in VF Page 
public class ListOfAccountExample 
{
    public list<Account> acclist {set;get;}
	public ListOfAccountExample()
    {
		 acclist = [select id,name,industry from Account];
    }
}