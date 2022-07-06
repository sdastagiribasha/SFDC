public with sharing class EmployeeDataController {
    
    @AuraEnabled(cacheable=true)
    public static List<Employee__c> fetchEmpData() {
        return [SELECT id,Name,LastName__c,Email__c,Phone__c,UserName__c,Password__c FROM Employee__c];
    }
 }
