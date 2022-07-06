public with sharing class ContactPaginationController {
    
    @AuraEnabled(cacheable=true)
    public static List<contact> fetchContactList(string searchKey, string sortBy, string sortDirection){
            //return [SELECT id,LastName,FirstName,Email,Phone FROM Contact LIMIT 10];
        string query = 'SELECT id,LastName,FirstName,Email,Phone FROM Contact';
        System.debug('query calling:' + query);

        if(searchKey != Null && searchKey != '') {
            string key = '%' + searchKey + '%';
            query += 'WHERE Name LIKE:key';
        }

        if(sortBy !=Null && sortBy != '') {
            query += 'ORDER BY' + sortBy + ' ' + sortDirection;
        }

        query = query + 'LIMIT 10';
        return Database.query(query);
    }


    //For Pagination
    @AuraEnabled(cacheable=true)
    public static List<Contact> getConList(string conName) {
        string keySearch = '%' + conName + '%';
        List<Contact> cclist = [SELECT id,LastName,FirstName,Email,Phone FROM Contact 
                                WHERE lastname LIKE : keySearch OR FirstName LIKE : keySearch OR Email LIKE: keySearch OR Phone LIKE : keySearch];
        return cclist;
    }

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [
            SELECT
                Id,
                Name,
                FirstName,
                LastName,
                Title,
                Phone,
                Email
            FROM Contact
            LIMIT 10
        ];
    }
}
