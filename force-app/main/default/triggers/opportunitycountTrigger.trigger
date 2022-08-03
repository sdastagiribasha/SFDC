trigger opportunitycountTrigger on Opportunity (before insert,before update,before delete,after insert,after update)
{
    if(Trigger.isAfter)
    {
        if(Trigger.isInsert||Trigger.isUpdate)
        {
            Opportunitycount.lisofcounts(trigger.new);
        }
    }
}