global class OppertunityProductCreation implements Database.Batchable <sobject> 
{
    global Database.QueryLocator start (Database.BatchableContext bc)
    {
        string query =('select id,name,closedate,stagename from opportunity ');
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,list<Opportunity> scope)
    {
        list<opportunitylineitem> oppor = new list<opportunitylineitem>();
        for(opportunity op:scope)
        {
            if(op.StageName=='Prospecting')
            {
                opportunitylineitem opc = new opportunitylineitem();
                opc.OpportunityId=op.Id;
                opc.quantity=5;
                opc.TotalPrice=100;
                opc.PricebookEntryId= [select id from pricebookentry where product2.name='GenWatt Diesel 200kW' limit 1][0].id;
                oppor.add(opc);
            }
        }
        insert oppor;
        
    }
    global void finish(Database.BatchableContext bc)
    {
        
    }
}