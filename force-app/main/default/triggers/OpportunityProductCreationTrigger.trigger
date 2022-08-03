/*
  1. If an opportunity stage is "Prospecting", the Opportunity product should be created under the opportunity called "Sample". 
 The system should run and check for the opps every morning at 6 am EST and creates the opp product accordingly.
 */
trigger OpportunityProductCreationTrigger on Opportunity (after insert)
{
    list<opportunitylineitem> oppor = new list<opportunitylineitem>();
        for(opportunity op:Trigger.New)
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