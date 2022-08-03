trigger AccountContactDeadTrigger on Contact (before insert,before update,after insert,after update)
{
    if(Trigger.isAfter && Trigger.IsInsert||Trigger.isAfter && Trigger.Isupdate)
    {
        AccountContactDead.updated(Trigger.New);
    }
}