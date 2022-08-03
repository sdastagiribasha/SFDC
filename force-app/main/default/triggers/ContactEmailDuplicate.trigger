/*when ever contact phone ischanged then it should update Account phone and its related opportunity phone*/
trigger ContactEmailDuplicate on Contact (after insert,after update) {

    Map<id,string> conPhoneMap = new Map<id,string>();
    List<Account> accUpdateList = new List<Account>();
    List<Opportunity> oppUpdateList = new List<Opportunity>();
    for(Contact c: Trigger.New) {
        if(c.Phone!=Null && c.Phone!=trigger.oldMap.get(c.Id).Phone) {
            conPhoneMap.put(c.AccountId,c.Phone);
        }
    }
    
    for(Account a: [SELECT id,phone,(SELECT id,Phone__c FROM Opportunities) FROM Account WHERE id IN :conPhoneMap.keySet()]) {
        a.Phone=conPhoneMap.get(a.Id);
        accUpdateList.add(a);
        for(Opportunity o: a.opportunities) {
            o.Phone__c=conPhoneMap.get(a.Id);
            oppUpdateList.add(o);
        }
    }
    
    if(accUpdateList.size()>0) {
        UPDATE accUpdateList;
    }
    
    if(oppUpdateList.size()>0) {
        UPDATE oppUpdateList;
    }
}