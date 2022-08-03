trigger citystatecountryTrigger on Account (before insert,before update,before delete,after insert,after update) 
{
    /*
if(trigger.isInsert && trigger.isBefore)
{
Feb2019Test.ValidateAccountAddress(trigger.new);
}
else if(trigger.isInsert && trigger.isBefore)
{
Feb2019Test.ValidateAccountAddress(trigger.new);
}
*/
    citystatecountry.Accountinformation(trigger.new);
}