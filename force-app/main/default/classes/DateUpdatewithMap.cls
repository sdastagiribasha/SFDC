/*
let's account related to few of these contact has same date on some field every contact below those accounts have to be updated to that
date gather all the contact where the account has same date and create a map of date to list of contacts.
*/
public class DateUpdatewithMap {
    
    public static void methodCall(list<contact> conlist) {
        Map<id,Date> maps = new Map<id,Date>();
        set<id> accountids = new set<id>();
        for(contact c: conlist) {
            maps.put(c.AccountId,c.Birthdate);
            accountids.add(c.AccountId);
        }        
        
        list<Account> acclist = new list<Account>();
        for(Account a: [select id,name from Account where id in: accountids]) {
            if(maps.containskey(a.id)) {
                a.SLAExpirationDate__c = maps.get(a.Id);
                acclist.add(a);
            } 
        }
        update acclist;
        
        system.debug('Updating of Account:' + acclist);
        
        Map<id,list<Contact>> mapslist = new Map<id,list<Contact>>();
        list<Contact> cclist = new list<Contact>();
        list<Contact> contactlist = [select id,name,Accountid,Birthdate from Contact where Accountid in : maps.keyset()];
        for(Contact cc: contactlist) {
            if(!mapslist.containskey(cc.AccountId)) {
                mapslist.put(cc.AccountId, new list<Contact>());
            }
            cc.Birthdate = maps.get(cc.AccountId);
            mapslist.get(cc.AccountId).add(cc);
           cclist.add(cc);
           system.debug('Updating Account related contacts:' + cclist);
        }       
        update cclist;
        system.debug('contact list updated :' + cclist);
    }
}

/*
When ever contact date is updated parent objecT(Account) also need to update with any date field 
along with related child contacts also need to updated.
*/

/*
 for(Contact c: [select id,name,Accountid from Contact where Accountid in : accountids]) {
            if(mapslist.IsEmpty()) {
                mapslist.put(c.AccountId, new list<contact>());
                c.Birthdate=maps.get(c.AccountId);
            }
            mapslist.get(c.AccountId).add(c);
            cclist.add(c);
        }
*/