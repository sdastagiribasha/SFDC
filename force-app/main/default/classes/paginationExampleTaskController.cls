public with sharing class paginationExampleTaskController {

    public paginationExampleTaskController() {

    }

    @AuraEnabled(cacheable=true)

    public static Integer getAccountsCount(){

        return [SELECT COUNT() FROM Account];

    }


    @AuraEnabled(cacheable=true)

    public static List<Account> getAccounts(Integer offsetRange){

        if(offsetRange == null){

            return [SELECT Id, Name, Rating, Industry FROM Account LIMIT 25];

        }else{

            return [SELECT Id, Name, Rating, Industry FROM Account LIMIT 25 OFFSET :offsetRange];

        }

    }
}
