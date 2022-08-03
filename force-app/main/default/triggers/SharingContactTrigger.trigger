trigger SharingContactTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete)
{
    if(Trigger.IsAfter && Trigger.IsInsert)
    {
        SharingContact.recordSharing(Trigger.New);
    }
}