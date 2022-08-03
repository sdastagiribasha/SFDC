trigger CustomCheckBoxTrigger on Account (before insert,before update,after insert,after update)
{
    if(Trigger.IsAfter && Trigger.IsUpdate)
    {
        CustomCheckBox.display(Trigger.new);
    }
}