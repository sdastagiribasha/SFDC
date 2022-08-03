trigger NoOfContactsTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete)
{
    if(Trigger.IsAfter && Trigger.IsInsert)
    {
        NoOfContacts.countingContacts(Trigger.New);
    }
}