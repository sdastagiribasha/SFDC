trigger Morethan3RelatedTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete)
{
    if(Trigger.IsBefore && Trigger.IsInsert)
    {
        Morethan3Related.updateContacts(Trigger.New);
    }
}