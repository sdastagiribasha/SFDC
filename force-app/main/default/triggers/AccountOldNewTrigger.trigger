trigger AccountOldNewTrigger on Account (before insert)
{
    if(Trigger.Isafter && Trigger.Isinsert)
    {
        AccountOldNew.DuplicateNotAllowed(Trigger.oldMap, Trigger.newMap);
    }
}