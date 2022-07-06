public with sharing class WiretoFunctionController {
    // wire to function without parameter
    @AuraEnabled(cacheable=true)
    public static list<Account> fetchAccounts() {
        return [SELECT id,name,Industry from Account];
    }

    //Using Imperative method example
    @AuraEnabled
    public static Boolean accountList(string username, string password){
        list<Account> acclist = new list<Account>();
        try {
            acclist = [SELECT id,name,Industry,phone FROM Account where name=:username and phone=:password];
            if(acclist.size()>0){
                return true;
            }
            else {
                return false;
            }

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}