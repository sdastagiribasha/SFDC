/*
Create a trigger that runs whenever an opportunity is created or updated. The Trigger Needs to check all the other opportunities related to the 
Account of the opportunity being updated.it should check to see if any of the opportunities have a stagename equal to 'Closed Won -oneTime' or 
'Closed Won-Recurring' and if so, it should update the account type to 'Customer'. if none of the opportunies are closed won, the Account type
should be 'Prospect'.
*/
public class OpportunityUpdateWithMAP {
    //------------------------------------ With MAP Concept -----------------------------------------------
    public static void oppfireAccount(list<opportunity> opplist) {
        set<id> accountids = new set<id>();
        for(Opportunity op: opplist) {
            if(op.StageName=='Closed Won' || op.StageName=='Closed Lost'){
                accountids.add(op.AccountId);
            }
        }
        
        Map<Id,list<Opportunity>> mapslist = new Map<Id,list<Opportunity>>();
        for(opportunity opp: [select id,name,Accountid from Opportunity where Accountid in: accountids]){
            if(!mapslist.containskey(opp.AccountId)) {
                mapslist.put(opp.AccountId, new list<opportunity>());
            }
            mapslist.get(opp.AccountId).add(opp);
        }
        list<Account> listofAcc = new list<Account>();
        List<Account> acclist =[select id,name from Account where id in: accountids];
        for(Account acc: acclist) {
            if(mapslist.containskey(acc.Id)) {
                acc.Type='Customer - Direct';
            }
            else{
                acc.Type='Prospect';
            }
            listofAcc.add(acc);
        }
        update listofAcc;
    }
}

/* -------------------Without MAP Concept-------------------------------
 public static void allotheropp(list<opportunity> opplist) {
        Map<string,list<string>> maps = new Map<string,list<string>>();
        set<id> accountids = new set<id>();
        for(opportunity op:opplist) {
            accountids.add(op.Accountid);
        }
        
		list<Account>  acclist = new list<Account>();
        for(Account a:[select id,name from Account where id in:maps.keySet()]){
            for(opportunity oppfields :opplist) {
                if(oppfields.StageName=='Closed Won'|| oppfields.StageName=='Closed Lost'){
                    a.Type='Customer - Direct';
                    //acclist.add(a);
                }else {
                    a.Type='Prospect';
                    //acclist.add(a);
                }
                acclist.add(a);
            }    
             update acclist;       
        }        
    }
    
 */