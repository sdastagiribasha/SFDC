//show list of students by selected activities (Cricket, Chess etc) 
//Write a helper method that will be called from vf page Click of “SEARCH”button

public class SelectedActivities 
{
    public string active {Set;get;}
    public list<StudentActivity__c> stuact{set;get;}
   
	public void displayRecords()
    {
       stuact = [select name,StudentMasterId__r.name,Activity__r.name from StudentActivity__c
                                          where Activity__r.name=:active];
        if(stuact.size()==0)
        {
     		apexpages.Message msg= new apexpages.Message(Apexpages.Severity.ERROR,'Sorry No Record Found');
            apexpages.addMessage(msg);
        }  
        system.debug(stuact);
    }
}