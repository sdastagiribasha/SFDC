trigger AccountCreatingContactTrigger on Account (before insert,before update,after insert,after update) 
{
    if(Trigger.isAfter && Trigger.IsInsert)
    {
        AccountCreatingContact.creatingContact(Trigger.New);
    }
    
   
}