//Create custom field on Lead object to store number of employees (number field). When lead status is set to CONVERTED.
//Automatically create a new account, contact (should be equal to number of employees in the lead record) and create one opportunity.  
//Write test classes for this to test positive, negative and bulk volume scenarios.  Aim for 75% coverage.
//Account record mandatory fields – Industry 
//Opportunity record mandatory fields (CLOSED DATE should be 30 days from current date and it should not fall on a Saturday or Sunday).

public class Leadstatus
{ 
	public  static void leadrecords(list<lead> lc)
    {
       list<lead> lc1 = new list<lead>();
        for(lead l: lc)
        {
            if(l.Status=='Closed - Converted')
            {
                lc1.add(l);
            }
        }
        Date cdate= system.today();
        cdate=cdate.addDays(30);
        if(cdate.day()==1)
        {
            cdate=cdate.addDays(2);
        }
        else if(cdate.day()==2)
        {
            cdate=cdate.addDays(1);
        }
        else
        {
            cdate=cdate;
        }
        list<Account> accountlist = new list<Account>();
        list<contact> contactlist = new list<contact>();
        list<opportunity> opportunitylist = new list<opportunity>();
        for(lead l:lc1)
        {
            Account a = new Account();
                a.name=l.Company;
            	a.Industry=l.Industry;
            	a.BillingCity=l.City;
           		a.BillingCountry=l.Country;
            	a.BillingState=l.State;
                accountlist.add(a);
        }
        insert accountlist;
       for(Account a:accountlist)
        {
            for(lead l: lc1)
            {
                for(integer i=0;i<l.NumberOfEmployees;i++)
                {
                    contact c = new contact();
                    c.FirstName=l.FirstName;
                    c.lastname=l.LastName+i;
                    c.AccountId=a.id;
                    contactlist.add(c);
                }
            }
        }
        insert contactlist;
        for(Account a:accountlist)
        {
            opportunity o = new opportunity();
            o.name=a.Name+'-opp';
            o.AccountId=a.Id;
            o.StageName='Prospecting';
            o.CloseDate=cdate;
            opportunitylist.add(o);
        }
        insert opportunitylist;
    }
}