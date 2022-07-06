//how to use Map
public class Map_EXampleUsecase {
	public list<Account> acclist;
    public list<Contact> conlist;
    public Map<string,list<string>> mapacccon {set;get;}
    
    public Map_EXampleUsecase() {
        acclist = [select id,name from Account];
        conlist = [select id,lastname,Accountid from Contact where Accountid in :acclist];
        /*
        set<id> accountids = new set<id>();
        for(Contact c: conlist) {
            accountids.add(c.AccountId);
        }
        */
        mapacccon = new Map<string,list<string>>();
        for(Account a: acclist) {
            list<string> contactListInternal = new list<string>();
        for(contact c: conlist) {
            if(a.id==c.AccountId) {
                contactListInternal.add(c.LastName);
            }
        }
         mapacccon.put(a.Name,contactListInternal);
        }
        
    }
    
}