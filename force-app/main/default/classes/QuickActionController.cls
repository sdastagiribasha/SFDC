public with sharing class QuickActionController {
   @AuraEnabled
   public static void createAccount(string name,string phone){
    try {
        Account a = new Account();
        a.name = name;
        a.phone = phone;
        insert a;
    } catch (Exception e) {
        throw new AuraHandledException(e.getMessage());
    }
   }
}
