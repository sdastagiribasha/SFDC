//Using Lightning Data Service
public class AuraOpportunityDataService
{
	@AuraEnabled
    public static list<Opportunity> getOpportunity(string oppstagename)
    {
        list<opportunity> opplist=[select name,closeDate,stagename from opportunity where stagename=:oppstagename];
        return opplist;
    }
}