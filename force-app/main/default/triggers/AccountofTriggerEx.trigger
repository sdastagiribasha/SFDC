trigger AccountofTriggerEx on Account (before insert)
{
    //AccountofTrigger.display(Trigger.New);
    for(Account a:Trigger.New)
    {
        if(a.Industry=='Banking')
        {
            a.Ownership='Public';
        }
    }
}