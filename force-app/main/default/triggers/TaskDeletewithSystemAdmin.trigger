//Write a trigger, only system admin user should be able to delete the task.
trigger TaskDeletewithSystemAdmin on Task (before delete) {
    id profileids = userinfo.getProfileId();
    profile profileName = [SELECT id,name FROM Profile where id =: profileids];
    for(Task t: Trigger.Old) {
        if(profileName.Name!='System Administrator') {
            t.addError('No access for deletion');
        }
    }	
}