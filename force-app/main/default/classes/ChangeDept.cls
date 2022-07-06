//Change dept from MECH to CSE for all students (for given list of students)
public class ChangeDept
{
	public static void deptCsetoMech(string fromdept,string todept)
    {
        list<StudentMaster__c> listofstudent =[select name,Email__c,CourseId__c from StudentMaster__c 
                                               where CourseId__r.Branches__c=:fromdept];
        list<course__c> listofcourse = [select Branches__c from course__c where Branches__c=:todept];
        list<StudentMaster__c> lst = new list<StudentMaster__c>();
        id  i=listofcourse[0].id;
        for(StudentMaster__c str :listofstudent)
        {
            str.CourseId__c=i;
            system.debug(lst);
            lst.add(str);
        }
        update lst;
    }
}