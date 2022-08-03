trigger AccountUsingMapTrigger on Account (after update) 
{
    //AccountUsingMap.accountPhone(Trigger.oldmap,Trigger.newmap);
    Map<Date,string> maps = new Map<Date,string>();
    set<id> contactids = new set<id>();
    for(Account a:Trigger.New) {
        maps.put(a.SLAExpirationDate__c, a.id);
        contactids.add(a.Id);
    }
    list<Account> acclist = new list<Account>();
    list<Contact> cclist = [select id,name,birthdate from contact where Accountid in : contactids];
    for(contact c: cclist) {
        if(c.birthdate!=Null){
            
            
        }
    }
}