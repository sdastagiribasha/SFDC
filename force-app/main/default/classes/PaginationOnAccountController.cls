/*
Display Account Records with Search functionality using Table format along with Pagination in LWC.
*/
public with sharing class PaginationOnAccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList (string searchKey) {
        string keySearch = '%' + searchKey + '%';
        List<Account> acclist = [SELECT id,Name,industry,Phone,type FROM Account WHERE Name LIKE : keySearch OR Industry LIKE : keySearch OR Type LIKE : keySearch OR Phone LIKE : keySearch];
        return acclist;
    }
    
}