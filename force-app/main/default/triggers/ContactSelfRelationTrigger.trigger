trigger ContactSelfRelationTrigger on Contact (before insert,before update,before delete,after insert,after update,after delete,after undelete) {
   /*
    if(Trigger.IsAfter && Trigger.IsUpdate){
       // ContactSelfRelation.contactUpdate(Trigger.New);
        ContactSelfRelation.conMethod(Trigger.New);
       //selfContactUpdatedMAP.methodCalling(Trigger.New);
    }
    */
    /*
    if(Trigger.IsAfter && Trigger.IsUpdate) {
        if(!RecursionAvoidForContact.flag) {
            RecursionAvoidForContact.flag = true;
            DateUpdatewithMap.methodCall(Trigger.New);
        }
    }
*/
    
}