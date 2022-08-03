trigger OpportunityUpdateWithMapTrigger on Opportunity (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
    if(Trigger.IsAfter) {
        if(Trigger.IsInsert || Trigger.IsUpdate) {
            //OpportunityUpdateWithMAP.allotheropp(Trigger.New);
            OpportunityUpdateWithMAP.oppfireAccount(Trigger.New);
        }
    }

}