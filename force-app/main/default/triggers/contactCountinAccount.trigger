trigger contactCountinAccount on Contact (after insert) {
    Map<string,list<string>> mp = new Map<string,list<string>>();
    set<string> accountids = new set<string>();
    for(contact c: Trigger.New) {
        accountids.add(c.Accountid);
    }
    for(string acc: accountids) {
        list<string> conlist = new list<string>();
        for(contact c: Trigger.New) {
            if(acc==c.AccountId) {
                conlist.add(c.Id);
            }            
        }
       mp.put(acc,conlist); 
    }
    list<Account> acclist = new list<Account>();
    for(Account a: [select id,name,No_Of_Contacts__c from Account where id in:mp.keySet()]) {
        if(a.No_Of_Contacts__c >0) {
            a.No_Of_Contacts__c += (mp.get(a.Id)).size();
            acclist.add(a);
        }else {
            a.No_Of_Contacts__c=1;
            acclist.add(a);
        }
    }
    update acclist;
        
    
    /*
    set<id> accountids = new set<id>();
    for(contact c: Trigger.New) {
        accountids.add(c.Id);
    }
    list<Account> acclist = [select id,name,(select id,lastname from contacts) from Account where id=:accountids];
    list<account> acc = new list<account>();
    for(Account a: acclist) {
        a.No_Of_Contacts__c = a.contacts.size();
        acc.add(a);
        update acc;
    }
    */

}