//Ex:- Calling List of Records from Serverside Controller(Apex) Method to lightning Javascript Controller
public class AuraOpportunityListExample
{
    @AuraEnabled
    public static list<Opportunity> getRecords()
    {
       list<Opportunity> opplist =[select id,name,stagename from opportunity limit 5];
        return opplist;
    }
}