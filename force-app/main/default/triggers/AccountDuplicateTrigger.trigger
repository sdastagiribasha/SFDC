trigger AccountDuplicateTrigger on Account (before insert,before update,before delete,after insert,after update,after delete) 
{
    if(Trigger.IsInsert && Trigger.IsBefore)
    {
       AccountDuplicate.duplicateNotAllowed(Trigger.New);
    }
}