@isTest
public class LeadstatusTesting 
{
    @isTest
    static void testingleadstatus()
    {
        lead l = new lead();
        l.LastName='bashaShaik';
        l.Company='Airtel';
        l.Status='open -Notcontacted';
        l.NumberOfEmployees=1;
        l.City='Hyderabad';
        l.State='Telangana';
        l.Country='India';
        insert l;
        lead acc =[select Status from lead where id=:l.id];
        acc.Status='Closed - Converted';
        update acc;
        lead le=[select lastname,company,status,numberofEmployees,city,state,country from Lead where id=:l.id];
        system.assertEquals(1,le.NumberOfEmployees);
                
    }
}