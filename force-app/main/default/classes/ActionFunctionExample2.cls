//ActionFunction on Leadsource,Based on Leadsource picklistvalues display contact records
public class ActionFunctionExample2 
{
    public contact cc 					{set;get;}
    public list<contact> listofcontacts {set;get;}
	public  ActionFunctionExample2()
    {
        cc = new contact();
        listofcontacts = new list<contact>();
    }
    public void displayrecords()
    {
       listofcontacts=[select lastname,firstname, leadsource from Contact where leadsource=:cc.LeadSource];
    }
}