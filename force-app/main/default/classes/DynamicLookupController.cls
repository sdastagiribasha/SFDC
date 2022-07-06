public with sharing class DynamicLookupController {
    @AuraEnabled(cacheable=true)
    public static list<Account> findAccounts(string searchkey){
        list<Account> acclist = [SELECT id,name FROM Account WHERE name LIKE : searchkey WITH SECURITY_ENFORCED];
        return acclist;
    }
}