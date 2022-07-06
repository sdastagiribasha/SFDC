/*
write a LWC component to display the contact deatils with search field.
*/
public with sharing class displayContactDeatilsController {

    @AuraEnabled(cacheable=true)

    public static list<Contact> fetchContacts(string contName) {
        string searchkey = '%' + contName + '%';
        return [SELECT id,firstname,lastname,phone,email FROM Contact WHERE lastname like :searchkey];
    }
}
