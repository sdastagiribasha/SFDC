//How to display Case records through input check box
public class CaseRecords 
{
	@AuraEnabled
    public static list<Case> getcases()
    {
        list<Case> caselist =[select id,casenumber,subject,type from case];
        return caselist;
    }
}