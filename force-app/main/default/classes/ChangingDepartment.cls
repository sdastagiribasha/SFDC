//Change dept from CSE to MECH for all students (for given list of students)
public class ChangingDepartment
{
	public void depetchange(string fromdept,string todept)
    {
        list<StudentMaster__c> listofstudent = [select name,CourseId__c from StudentMaster__c where CourseId__r.Branches__c=:fromdept];
      
    }
}