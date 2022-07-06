public with sharing class AccountwiretopropertyExampleController {
    @AuraEnabled(cacheable=true)
    public static list<Account> fetchAccounts() {
        return [SELECT id,name,industry FROM Account];
    }
}