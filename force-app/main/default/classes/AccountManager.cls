public with sharing class AccountManager {

    @AuraEnabled(cacheable=true)
    public static List<Account> listOfAccounts() {
        Http http = new Http();
        HttpRequest  request = new HttpRequest();
        request.setEndpoint('callout:AccountNamedCredential/services/apexrest/AccountService');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        system.debug('response coming '+response);
        system.debug('response status code '+response.getStatusCode());
        if(response.getStatusCode() == 200) {
            List<Account> results = (list<Account>) JSON.deserialize(response.getBody(), list<Account>.class);
            return results;
        } else {
            System.debug('else condition is '+ response.getBody());
        }
        return null;
    }
}