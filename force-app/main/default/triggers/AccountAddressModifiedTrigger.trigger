trigger AccountAddressModifiedTrigger on Account (before insert,before update,after insert,after update)
{
    if(Trigger.IsAfter && Trigger.IsUpdate && AccountAddressModified.Updated==False)
    {      
        AccountAddressModified.accountBillingAddress(Trigger.New);
    }
}