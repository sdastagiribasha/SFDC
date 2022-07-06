/*
There is a self looup relation from contact to contact if the parent contact's lastname changes.
Change the last name of child contacts and send email to all the child contacts using Trigger/flow.

*/
public class ContactSelfRelation {
    public static void conMethod(list<contact> conlist){
        Map<id,string> maps = new Map<id,string>();
        set<id> accountids = new set<id>();
        for(contact cc: conlist) {
           maps.put(cc.Contact_Related__c,cc.LastName);
            accountids.add(cc.Contact_Related__c);
            }
        
        Map<id,list<contact>> mapslist = new Map<id,list<contact>>();
        list<contact> cclist = new list<contact>();
        for(Contact c:[select id,lastname,Contact_Related__c from contact where id in:accountids]) {
            if(!mapslist.containskey(c.id)) {
                mapslist.put(c.id,new list<contact>());
                c.LastName=maps.get(c.id);
            }
            mapslist.get(c.id).add(c);
            cclist.add(c);
            
        }  
        update cclist;   
  }
}
        
    
    
    
    
  /*  
    public static void contactUpdate(list<Contact> conlist) {
        Map<string,list<string>> maps = new Map<string,list<string>>();
        //for(Contact c:[select id,lastname,Contact_Related__c from contact where Contact_Related__c in:conlist ])            
        set<string> accountids = new set<string>();
        for(contact c: conlist) {
            accountids.add(c.Accountid);
        }

		list<Contact> cclist = new list<Contact>();
        for(contact cParent: [select id,lastname,Contact_Related__c from contact where id in:maps.keyset()]) {
            for(contact cChild :conlist) {
                if(cParent.LastName!=Null) {
                    cChild.LastName = cParent.LastName;
                    Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                    string[] toaddr = new string[]{cChild.Email};
                        msg.setToAddresses(toaddr);
                    	msg.setSubject('Contact Self Realtion Testing');
                    	msg.setPlainTextBody('Success Body');
                    Messaging.Email[] emails = new Messaging.Email[]{msg};
                        Messaging.sendEmail(emails);
					cclist.add(cChild);                                   
                }
            }
            update cclist;
        }
        
    }

*/