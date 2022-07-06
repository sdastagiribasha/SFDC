/*
Whenever an event is created or updated. updated the latest activity date (activity date with the highest value among all events 
under the related record) on the parent opportunity on all related child opportunity.
*/
public class EventDateUpdateWithMap {
    
    public static void methodCalling(list<Event> eventlist) {
        set<id> oppidset = new set<id>();
        for(Event ev: eventlist) {
            if('opportunity'.equalsIgnoreCase(String.valueof(ev.WhatId.getSObjectType()))) {
                oppidset.add(ev.WhatId);
            } 
        }        
        //Map<Date,list<Event>> mapslist = new Map<Date,list<Event>>(); 
        list<Opportunity> opplist = new list<Opportunity>();
        for(opportunity opp: [select id,name,(select id,
                                              activitydate from Events order by 
                                              activitydate desc limit 1) from Opportunity where id in: oppidset]) {
                               if(!opp.Events.isEmpty()) {
                                   opp.Name = String.valueof(opp.Events[0].activitydate);
                                   opplist.add(opp);
                                   }   
                          }
        update opplist;
    }
    
}