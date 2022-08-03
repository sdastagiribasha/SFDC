trigger UpdateNoContactsTrigger on Contact (after insert,after update,after delete,after undelete)
{
   set<id> accids = new set<id>();
    
    if(Trigger.isAfter) {
        if(Trigger.isinsert || Trigger.isDelete) {
            for(contact c: Trigger.New) {
                accids.add(c.Accountid);
            }            
        }
        if(Trigger.isUpdate || Trigger.isUndelete) {
            for(contact c1: Trigger.Old) {
                accids.add(c1.Accountid);
            }
        }
    }
    
     list<Account> acclist =[SELECT id,name,No_Of_Contacts__c,(SELECT id,lastname FROM contacts) FROM Account WHERE id IN :accids];
        list<Account> acc = new list<Account>();
        if(!acclist.isEmpty()) {
        for(Account a : acclist)
        {
            a.No_Of_Contacts__c=a.contacts.size();
            acc.add(a);
        }
        update acclist;
    }
    
}