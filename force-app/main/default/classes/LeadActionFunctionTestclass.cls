@isTest
public class LeadActionFunctionTestclass 
{
 @isTest
  static void testingleadActionfunction()
  {
      integer minimumvalue = 100;
      integer maximumvalue = 1000;
      lead l = new lead();
      l.Company='Amazon';
      l.LastName='a';
      l.AnnualRevenue=500;
      l.Status='closed-converted';
      insert l;
      LeadActionfunction la = new LeadActionfunction();
      la.display();
      integer count=[select count() from lead where AnnualRevenue >:minimumvalue and AnnualRevenue <:maximumvalue];
      system.assertEquals(count,1);
  }
}