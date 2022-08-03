trigger ContactEmailsInAccountTrigger on Contact (before insert,before update,after insert,after update)
{
    if(Trigger.IsAfter && Trigger.IsUpdate)
    {
        ContactEmailsInAccount.displayEmail(Trigger.New);
    }
}