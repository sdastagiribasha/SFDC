public with sharing class DollController {
    
    @AuraEnabled(cacheable=true)
    public static List<Doll__c> fetchDolls () {
        List<Doll__c> dollList = [SELECT id,Name,Age__c,sex__c,Height__c,Weight__c FROM Doll__c];
        return dollList;
    }
}
