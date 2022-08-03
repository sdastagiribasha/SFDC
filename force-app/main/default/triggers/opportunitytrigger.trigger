trigger opportunitytrigger on Opportunity (before insert, after insert, before update, after update, before delete, after delete, after undelete) 
{
    TriggerDispatcher.run(new TriggerHandler(), 'OpportunityTrigger');

    /*
    if(Trigger.isafter)
    {
        If(Trigger.isInsert || Trigger.isUpdate){
            opportunitymanatory.counting(trigger.new);
             system.debug(Trigger.new);
        }
    }
    */
}