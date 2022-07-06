@RestResource(urlMapping='/getAccountinfotofetchsinglerecord/*')
global with sharing class getAccountfetchsingleRecord {
    
    @Httpget
    global static Account fetchAccount() {
        Account acc = new Account();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string accid = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        acc=[select id,name from Account where id=:accid];
        return acc;
    }
    
    @HttpPost
    global static string creatingRecord() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string jsonString = req.requestBody.tostring();
        responseWrapper wResp = (responseWrapper) JSON.deserialize(jsonString, responseWrapper.class);
        Account obj = new Account();
        obj.Name = wResp.Name;
        insert obj;
        return 'Success';
    }
    
    @HttpPut
    global static string updatingRecord() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        string jsonString = req.requestBody.tostring();
        responseWrapper wrap = (responseWrapper)JSON.deserialize(jsonString, responseWrapper.class);
        Account obj = new Account();
        obj =[select id,name,industry,AccExternalid__c from Account where AccExternalid__c=:wrap.externalId];
        obj.Industry='Banking';
        update obj;
        return 'Success';        
    }
    
    @HttpDelete
    global static string deleteRecord() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Account obj = new Account();
        string accid = req.requestURI.substring(req.requestURI.lastIndexof('/') + 1);
        obj = [select id,name from Account where id=:accid];
        return 'Success';
    }
        
    
    
    global class responseWrapper {
        global string name;
        global string externalId;
    }
}