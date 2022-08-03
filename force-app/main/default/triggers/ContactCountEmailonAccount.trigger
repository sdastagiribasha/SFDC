/*
 * Write a trigger to get Account related contact emails which are valid & invalid emails and display the count in respective Account.
    Need to get the Account related contact emails,which are valid & invalid emails and display the count in respective account.
 */

trigger ContactCountEmailonAccount on Contact (after insert,after update) {
   // ContactDuplicateController.avoidDuplicate(Trigger.New);
   public static Integer i = 0;
   public static Integer j = 0;
 
    set<id> accountids = new set<id>();
    for(Contact c: Trigger.New) {
        accountids.add(c.AccountId);
    }
    system.debug('Fetching Accountids:' + accountids);
    
    List<Contact> conlist = [SELECT id,email,Accountid FROM Contact WHERE Accountid IN:accountids];
    for(Contact con: conlist) {
        set<string> conemails = new set<string>();
        conemails.add(con.Email);
        
        //if(conemails != null && !conemails.isEmpty()){
        if(con.Email!=Null && con.Email!='') {
            if(Pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]{12}+.[a-zA-Z]{1,2}.[a-zA-Z]{1,2}', con.Email)) {
                system.debug('Printing Email:' + con.Email);
                i=i+1;
                system.debug('valid emails:' + i);
            }
            else {
                j=j+1;
                system.debug('invalid emails:' + j);
            }
        }
    
    Account acc = new Account();
    acc.Id= con.AccountId;
    acc.Valid_Email__c=i;
    acc.Invalid_Email__c=j;
    update acc;
    system.debug('Updating fields in Account:' + acc);
    }
}    
   





/*
    set<Id> accountids = new set<Id>();
    for(Contact c: Trigger.New) {
         Boolean stremail = c.Email.contains('@gmail.com');
        if(c.Email !=Null && stremail) {        
            accountids.add(c.AccountId);
        }
    }
    
   
    
    Map<Id,list<Contact>> mapslist = new Map<Id,list<Contact>>();
    for(Contact cc:[SELECT id,lastname,firstname,Accountid FROM Contact WHERE Accountid IN :accountids]) {
        if(!mapslist.containsKey(cc.Accountid)) {
           mapslist.put(cc.Accountid, new list<Contact>());
        }
        mapslist.get(cc.Accountid).add(cc);
    }
    
    list<Account> acclist = [SELECT id,name from Account WHERE id in:accountids];
    list<Account> accupdate = new list<Account>();
    for(Account a: acclist ) {
        if(mapslist.containsKey(a.Id)) {
            a.Valid_Email__c = mapslist.size();
        }
        else {
            a.Invalid_Email__c = mapslist.size();
        }
        accupdate.add(a);
    }
    update accupdate;
    */