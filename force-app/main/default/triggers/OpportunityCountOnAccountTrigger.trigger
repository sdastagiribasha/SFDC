trigger OpportunityCountOnAccountTrigger on Opportunity (before insert,before update,after insert,after update)
{
    if(Trigger.isafter && Trigger.isInsert)
    {
        OpportunityCountOnAccount.updateCount(Trigger.New);
    }
}