//How to display The List of Opportunity Records using lightning Platform
public class OpportunityRecordsDisplaying 
{
    @AuraEnabled
	public static list<opportunity> getopplist()
    {
        list<opportunity> opplist =[select id,name,Account.name,closedate,type,stagename,Amount from opportunity where ownerid=:userinfo.getUserId()];
        return opplist;
    }
}