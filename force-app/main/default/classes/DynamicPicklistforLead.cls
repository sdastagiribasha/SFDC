//Display picklist values dynamically in lightning component using apex
public class DynamicPicklistforLead 
{
    @AuraEnabled 
    Public static void createLead(Lead leadobj){
        try{
            
            insert leadobj; 
            
        }catch(Exception e){
            System.debug(e.getMessage());
            System.debug(e.getLineNumber());
        }
        
    }
    
    @AuraEnabled 
    public static Map<String, String> getIndustryFieldValue(){
        Map<String, String> options = new Map<String, String>();
        
        Schema.DescribeFieldResult fieldResult = Lead.Industry.getDescribe();
        
        List<Schema.PicklistEntry> pValues = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry p: pValues) {
            
            options.put(p.getValue(), p.getLabel());
        }
        return options;
    }
}