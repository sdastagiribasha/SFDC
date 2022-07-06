public with sharing class AccountRecordsWithDataTable {

    @AuraEnabled(cacheable=true)
    public static list<Account> getAccountList() {
        return [SELECT Id, Name, Type, Rating,Phone, Website, AnnualRevenue FROM Account LIMIT 10];
    }

    @AuraEnabled
    public static void deleteAccId(string ids){
        try {
            Account acc = [SELECT Id, Name, Type, Rating,Phone, Website, AnnualRevenue FROM Account WHERE id =:ids];
            delete acc;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Boolean updateRecord(List<Account> acclist){
        try {
            Update acclist;
            return true;
        } catch (Exception e) {
            //throw new AuraHandledException(e.getMessage());
            return false;
        }
    }
    

}
