/*
create one test class which implement everything about todays test class topic 
*/
public with sharing class AllAboutUnitTestController {
    
    //@TestVisible private static string contactid='0030o00002d8uDPAAY';
    @TestVisible private static void fetchnoofContacts(list<Contact> conlist) {

        set<id> accountids = new set<id>();
        for(Contact c: conlist) {
            accountids.add(c.Accountid);
        }
        list<Account> acclist = new list<Account>();
        list<Account> acclist1 = [SELECT id,name,No_Of_Contacts__c,
                                (SELECT id,lastname from contacts) FROM
                                 Account WHERE id in :accountids];
        for(Account a: acclist1) {
            //if(a.No_Of_Contacts__c!=Null || a.No_Of_Contacts__c = ' ') 
            if(!Test.isRunningTest()) {
                a.No_Of_Contacts__c=a.contacts.size();
                acclist.add(a);
            }
        }
        update acclist;
    }
}