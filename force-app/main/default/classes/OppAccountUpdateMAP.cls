/*
Create a trigger that runs whenever an opportunity is created or updated. The Trigger Needs to check all the other opportunities related to the 
Account of the opportunity being updated.it should check to see if any of the opportunities have a stagename equal to 'Closed Won -oneTime' or 
'Closed Won-Recurring' and if so, it should update the account type to 'Customer'. if none of the opportunies are closed won, the Account type
should be 'Prospect'.
*/
public class OppAccountUpdateMAP {
    public static void updateAccountMap(list<Opportunity> opplist) {
        set<id> accountids = new set<id>();
        for(opportunity op: opplist) {
            accountids.add(op.AccountId);
        }
        Map<id,list<opportunity>> maps = new Map<id,list<opportunity>>();
        list<Account> acclist = [select id,name from Account where id in: accountids];
        list<opportunity> olist = [select id,name,stagename from opportunity where  stagename='closed won' OR stagename='closed lost'];
        for(opportunity o: opplist){
            if(maps.containskey(o.AccountId)){
                maps.put(o.AccountId, new list<opportunity>());
            }
            maps.get(o.AccountId).add(o);
        }
    }
}