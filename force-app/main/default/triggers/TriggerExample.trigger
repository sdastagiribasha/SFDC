trigger TriggerExample on Account (before insert) 
{
    list<Account> acc = Trigger.New;
}