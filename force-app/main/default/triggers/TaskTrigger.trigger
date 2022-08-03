/*
Only system admin has to delete the task if any user delete the task thrown an like u dont have privilage to do this action contact system admin
*/
trigger TaskTrigger on Task (Before insert,Before update,before delete,after insert,after update,after delete,after undelete) {
    Id profileId = Userinfo.getProfileId();
    profile ProfileName = [SELECT Id,Name from Profile WHERE id=:profileId];
    if(Trigger.isBefore && Trigger.isDelete) {
        for(Task t : Trigger.old) {
            if(ProfileName.Name!='system Administrator') {
                t.addError('you dont have an option to delete the task, contact system admin');
            }
        }
    }
}