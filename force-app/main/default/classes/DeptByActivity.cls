//students by department, by activity 
//Write a helper method that will be called from vf page Click of “SEARCH”button

public class DeptByActivity
{
    //public string active{set;get;}
    public string dept{set;get;}
    public list<StudentActivity__c> stu {set;get;}
	public void display()
    {
       stu= [select name,StudentMasterId__r.CourseId__c from StudentActivity__c
             where StudentMasterId__r.CourseId__c=:dept];
        system.debug(stu);
    }
}