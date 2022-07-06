@isTest
public class opportunitycountTesting
{
	@isTest
    
    static void testingopportunity()
    {
        CitySateCountry__c csc = new CitySateCountry__c();
        csc.city__c='Banglore';
        csc.state__c='Karnataka';
        csc.country__c='India';
        insert csc;
        Account a = new Account();
        a.Name='basha';
        a.BillingCountry='india';
        a.BillingState='Karnataka';
        a.BillingCity='Banglore';
        
        insert a;
     list<opportunity> listvalues = new list<opportunity>();
        
      opportunity op = new opportunity();
        op.Name='op3';
        op.CloseDate=date.newInstance(2019,02,21);
        op.StageName='Prospecting';
        op.AccountId=a.id;
        listvalues.add(op);
        
        opportunity op1 = new opportunity();
        op1.Name='op4';
        op1.CloseDate=date.newInstance(2019,02,21);
        op1.StageName='Closed Won';
        op1.AccountId=a.id;
        listvalues.add(op1); 
        insert listvalues;
       //Opportunitycount.lisofcounts(listvalues);        
        Account accnt=[select name,Prospectingcount__c from Account where Id =:a.id];
        system.assertEquals(1,accnt.Prospectingcount__c);
    }
}