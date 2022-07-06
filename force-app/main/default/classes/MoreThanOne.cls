//show list of students who are playing in more than one activity 
//Write a helper method that will be called from vf page Click of “MORE THAN ONE ACTIVITY ”button

public class MoreThanOne 
{	
    public list<sobject> studentact{set;get;}
	public void showdmorethanone()
    {
     studentact =[select StudentMasterId__c,count(Activity__c) actcount from StudentActivity__c group by
                  StudentMasterId__c having count(Activity__c)>1];
     system.debug(studentact);
    }
}