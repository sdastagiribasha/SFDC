trigger AccountEditCountTrigger on Account (before insert,before update,before delete, after insert,after update,after delete) 
{
    
    if(Trigger.IsBefore)
    {
        if(Trigger.isinsert || Trigger.isupdate)
        {
            AccountEditCount.noofcounts(Trigger.New);   
        } 
    }
    if(Trigger.IsAfter && Trigger.IsUpdate)
    {
        AccountEditCount.displayOldNewvalues(Trigger.OldMap,Trigger.New); 
    }
}