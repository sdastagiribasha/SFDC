/*
There is a self looup relation from contact to contact if the parent contact's lastname changes.
Change the last name of child contacts and send email to all the child contacts using Trigger/flow.
*/
public class selfContactUpdatedMAP {
    public static void methodCalling(list<Contact> cclist) {
        Map<id,string> mapself = new Map<id,string>();
        set<id> selfcontacts = new set<id>();
        for(contact c: cclist) {
            mapself.put(c.ReportsToId,c.LastName); // Adding self lookup and lastname into Map
            selfcontacts.add(c.ReportsToId);
        }
        Map<id,list<contact>> mapslist = new Map<id,list<contact>>();
        list<contact> conlist = new list<contact>();
        for(contact cc: [select id,lastname,ReportsToId,email from Contact where ReportsToId in:selfcontacts]) {
            if(!mapslist.containskey(cc.Id)) {   // here we are checking if the key was not there then only this if loop works.
                mapslist.put(cc.id,new list<contact>()); // Adding key(cc.id), values(list of contacts)
                cc.LastName = mapself.get(cc.Id); // updating child contact name into above Map(mapselft) with current Parent contact ID.        
                mapslist.get(cc.id).add(cc); // fetching id with their list of records
                conlist.add(cc); 
                
                /*
                Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                string[] toaddr = new string[]{cc.Email};
                    msg.setToAddresses(toaddr);
                msg.setSubject('Contact Self Realtion Testing');
                msg.setPlainTextBody('Success Body');
                Messaging.Email[] emails = new Messaging.Email[]{msg};
                    Messaging.sendEmail(emails);
				*/
            }
        }
        update conlist;
    }
}