trigger AccountOpportunityAmountTrigger on Opportunity (before insert,before update,after insert,after update)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert || Trigger.IsUpdate)
        {
            AccountOpportunityAmount.updateAmount(Trigger.New);
        }
    }
}