trigger Contact2CreatingTrigger on Contact (before insert,before update,after insert,after update)
{
    if(Trigger.IsAfter && Trigger.isInsert)
    {
       AccountCreatingContact.contact2(Trigger.New);
    }
}