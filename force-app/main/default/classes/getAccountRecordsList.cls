@RestResource(urlMapping='/getAccountinfotofetchlistofrecords/*')
global with sharing class getAccountRecordsList {

    @Httpget
    global static list<Account> fetchAccountlist() {
        list<Account> acclist = new list<Account>();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        acclist = [select id,name,industry,phone from Account limit 10];
        return acclist;
    }
}