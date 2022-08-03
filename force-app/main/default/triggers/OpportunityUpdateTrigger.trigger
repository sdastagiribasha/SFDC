trigger OpportunityUpdateTrigger on Opportunity (before insert,after insert)
{
    if(Trigger.IsAfter && Trigger.IsInsert)
    {
        OpportunityUpdate oop = new OpportunityUpdate();
        oop.recordUpdate(Trigger.New);
    }
}