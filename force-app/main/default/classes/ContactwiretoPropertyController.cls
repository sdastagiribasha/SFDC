public with sharing class ContactwiretoPropertyController {

    @AuraEnabled(cacheable=true)
    public static list<Contact> fetchContacts(string sname){
        try {
           return [SELECT id,firstname,lastname,email,phone FROM contact 
                    WHERE firstname=:sname 
                    or lastname=:sname
                    or email=:sname];
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}