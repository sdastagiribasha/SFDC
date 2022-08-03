/*when ever contact phone ischanged then it should update Account phone and its related opportunity phone*/
trigger ContactPhone2Account2OpportunityUpdate on Contact (after update) {
    
    Map<Id,String> updatePhones = new Map<Id,String>();
    List<Account> accListValues = new List<Account>();
    List<Opportunity> opplist = new List<Opportunity>();
    for(contact con : Trigger.New) {
        if(con.Email!=Null && con.Email!=Trigger.oldMap.get(con.Id).Phone) {
            updatePhones.put(con.AccountId,con.Phone);
        }  
    }
    
    List<Account> acclist = [SELECT id,Name,Phone,(SELECT id,Name,Phone__c FROM Opportunities) FROM Account WHERE id IN:updatePhones.keySet()];
    for(Account acc: acclist) {
        acc.Phone = updatePhones.get(acc.Id);
        accListValues.add(acc);
        for(Opportunity op: acc.opportunities) {
            op.Phone__c=acc.Phone;
            opplist.add(op);
        }
    }
    
    if(accListValues.size()>0) {
        Update accListValues;
    }
    
    if(opplist.size()>0) {
        Update opplist;
    }
}