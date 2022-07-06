/*-------------------------------------------------------------------------------------------------
Author:             Dastagiri Basha Shaik
Date:               18-03-2022
Version:            1.0
Description:        invocable functionality for the recordtrigger flow, 
update custom fields with standaard field values
Ticket:             VCASF-191

History
======================                                       
----------------------------------------------------------------------------------------------------*/
public class CustomDateController {
    /*
* @description : Invocable apex method, 
* calling from the recordtrigger flow(Account Flow To Update Custom Lastmodifiedby)
* @params      : List of Strings nothing but list of record ids
* @Return type : void
* @lst modified:  Dastagiri Basha Shaik
*  */ 
    //@InvocableMethod(label='updateLastModifiedCustom')
    
    public static void updateLastModified(List<Account> newObjects)
    {
        try
        {
            String objName = '';
            if(newObjects.size() > 0) {
                //List<Account> objrecs = (List<Account>)newObjects;
                List<sobject> objrecs = (List<sobject>)newObjects;
                objName = newObjects[0].getSObjectType().getDescribe().getName();
                CustomObjectFieldType__mdt mtd = getMdtforCustomfields(objName);
                String standardfields = mtd.Standard_Fields__c;
                String customfields = mtd.Custom_Fields__c;  
                
                List<String> stdfieldStrings = standardfields.split(',');
                List<String> cusfieldStrings = customfields.split(',');
                List<SObject> sobList = new List<SObject> ();
                if(newObjects.size()>0) {
                    for(Sobject obj : newObjects)
                    {
                        String LastName = UserInfo.getLastName();
                        if(LastName !=mtd.User_LastName__c) {
                            Integer count = cusfieldStrings.size() - 1;
                            for(Integer i=0; i<= count; i++)
                            {
                                if(i==0) {
                                    obj.put(cusfieldStrings[i],UserInfo.getUserId());
                                }
                                if(i==1){
                                    obj.put(cusfieldStrings[i],Datetime.now());
                                }
                                if(i==2){
                                    String timeZone = UserInfo.getTimeZone().getID();
                                    Datetime dateGMT = Datetime.now();
                                    Datetime d1=Datetime.valueOf(dateGMT);
                                    string s1=d1.format('MM/dd/yyyy HH:mm a','America/Los_Angeles');
                                    string image = '<html><img width="20px" height="20px" alt=" " src="/resource/1647845840000/UserLogo"/></html>';
                                    string body = image +' <a href="/lightning/r/Account/'+UserInfo.getUserId()+'/view">'+UserInfo.getName()+'</a>' + ', '+ s1;
                                    obj.put(cusfieldStrings[i],body);
                                }
                            }
                        }
                    }
                    
                }
            }
        }
        Catch(Exception e)
        {
            
        }
    }
    
    /**
* @description : Utility method to read the custom meta data based on the object name 
* calling from the updateLastModified method
* @params      : SObject Name
* @Return type : Custom_Modified_Field__mdt record
* @lst modified:  Dastagiri Basha Shaik
*  */  
    public static CustomObjectFieldType__mdt getMdtforCustomfields(String sobjName) {
        CustomObjectFieldType__mdt mtdRecord = new CustomObjectFieldType__mdt();
        try{
            Map<string,List<string>> standardFieldMap = new Map<string,List<string>>();
            Map<string,List<string>> customFieldMap = new Map<string,List<string>>();
            if(String.isNotBlank(sobjName) || String.isNotEmpty(sobjName))
                mtdRecord = [SELECT Id,DeveloperName,objectName__c,
                             Standard_Fields__c,Custom_Fields__c,User_LastName__c 
                             FROM CustomObjectFieldType__mdt 
                             WHERE objectName__c =:sobjName 
                             LIMIT 1]; 
        }
        catch(Exception e){
            
        }
        return mtdRecord;
    }   
}