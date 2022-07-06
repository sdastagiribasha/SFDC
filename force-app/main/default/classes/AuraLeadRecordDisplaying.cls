//How to display the list of Lead Records
 public inherited sharing class AuraLeadRecordDisplaying 
 {
    public AuraLeadRecordDisplaying() 
    {

    }
    @AuraEnabled
    public static List<Lead> leadrecords()
    {
        list<Lead> leads =[select id,lastname,company,status from Lead];
        return leads;
    }
    
}