trigger leadstatusTrigger on Lead (before insert,before update,before delete,after insert,after update)
{
    if(Trigger.isAfter && Trigger.isUpdate)
    {
        Leadstatus.leadrecords(Trigger.New);
    }
}