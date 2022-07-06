// write a SOQL to fetch name,industry,phone from Account and display it in VFPage.
public class SOQL_Example
{
    public list<Account> acclist {set;get;}
	public 	SOQL_Example()
    {
        acclist=[select id,name,industry,phone from Account];
        system.debug('No of Account Records:'+ acclist);
    }
}