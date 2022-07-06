public with sharing class EmployeObjController {
    @AuraEnabled
    public static Employee__c fetchEmp(Employee__c emp) {
        insert emp;
        return emp;
    }
}