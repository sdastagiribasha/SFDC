//Change mail domain of all students from devanand@gmail.com to devanand@yahoo.com
public class ChangeEmailDomain 
{
    public static string Email;
	public static void domainChange()
    {
        list<StudentMaster__c> listofstudents =[select name,Email__C from StudentMaster__c];
        list<studentMaster__C> s = new list<studentMaster__C>();
        for(StudentMaster__c stu:listofstudents)
        {
            string[] emailstatus= string.valueOf(stu.Email__c).split('@');
            system.debug(emailstatus);
            Email=emailstatus[0];
            stu.Email__c= Email+'@yahoo.com';
            s.add(stu);       
        }
        update s;
        system.debug(s);
    }
}