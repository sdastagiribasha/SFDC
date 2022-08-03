trigger nocontactsupdatedTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete)
{
    if(Trigger.IsAfter && Trigger.IsInsert)
    {
       nocontactsupdated.updateContacts(Trigger.New);
    }
}