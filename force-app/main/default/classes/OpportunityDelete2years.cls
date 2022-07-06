//Write a Batch Apex to Delete Opportunities,which has created over 2 years, and no update on those records
global class OpportunityDelete2years implements Database.Batchable<Sobject>
{
	global Database.QueryLocator start(Database.BatchableContext bc)
    {
        string query ='select id,name from Opportunity where lastmodifiedDate<=Last_N_Years:2';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,list<Opportunity> scope)
    {
        system.debug('Opportunitylist'+scope);
        Delete scope;
    }
    global void finish(Database.BatchableContext bc)
    {
        System.debug('Finish');
    }
}