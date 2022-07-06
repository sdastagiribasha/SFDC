public class MapScenarioLiveExample {
    public static void methodCalling(list<contact> conlists) {
        set<id> accountids = new set<id>();
        for(contact c: conlists)
        {
            accountids.add(c.Accountid);
        }
        Map<string,list<string>> mapslist = new Map<string,list<string>>();
        
        for(Contact c: [select id,lastname,firstname from contact where id in : accountids limit 100]) {
            if(!mapslist.containskey(c.lastname)) {
                mapslist.put(c.lastname, new list<string>());
            }
            mapslist.get(c.lastname).add(c.FirstName);
        }
    }
}