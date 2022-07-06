//Write a Lightning Component to display the open cases related to the logged in user
public  class CaseRecordsDisplaying
{
    @AuraEnabled
	public static list<case> getCases()
    {
        list<Case> caselist = [select id,casenumber,subject,type,status from case where OwnerId=:Userinfo.getUserId()];
        return caselist;
    }
}