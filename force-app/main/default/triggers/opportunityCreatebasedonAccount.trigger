trigger opportunityCreatebasedonAccount on Account (before insert,before update,after insert,after update)
{
    if(Trigger.Isafter && Trigger.IsInsert) 
    {
        TriggerInsertExample2.creatingopportunity(Trigger.New);
    }
}