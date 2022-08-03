trigger AccountContactProfileTrigger on Account (before insert,before update,after insert,after update)
{
    if(Trigger.isAfter && Trigger.IsUpdate)
    {
        AccountContactProfile.updateProfile(Trigger.New);
    }
}