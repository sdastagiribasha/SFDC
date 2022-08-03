trigger contactoldnewTrigger on Contact (before insert,before update) 
{
    if(Trigger.Isbefore && Trigger.IsUpdate)
    {
        ContactOldNew.oldNewvaluesofcontact(Trigger.oldMap,Trigger.NewMap);
    }
    
}