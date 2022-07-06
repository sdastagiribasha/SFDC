public class LeadstatusExample
{
	public static void statusupdate(list<lead> le)
    {
        Date cDate=System.today();  
        cDate=cDate.addDays(30);
        if(cDate.day()==1)
        {
            cDate=cDate.addDays(2);
        }
        else if(cDate.day()==2)
        {
            cDate=cDate.addDays(1);
        }
        else
        {
            cDate=cDate;
        }
        
        list<Account> acc = new list<Account>();
        list<Contact> cc = new list<contact>();
        list<opportunity> opp = new list<opportunity>();
        for(Lead l :le)
        {
            
        }
        
        
    }
}