//get a list of students born in a particular week of the year or given date
public class DOBOnWeekYear 
{
    public date datename{set;get;}
    public date Weekstart{set;get;}
    public date weekEnd{set;get;}
    public list<studentMaster__c> studentlist {set;get;}
    
    public DOBOnWeekYear()
    {
        studentlist = new list<studentMaster__c>();
    }
    public pagereference weekofyear()
    {
        weekstart=Datename.tostartofweek();
        weekend=weekstart.adddays(7);
        studentlist = [select name, Email__c,DOB__C from studentMaster__c where DOB__C >=:weekstart and DOB__C<=:weekend];
        if(studentlist.isEmpty())
        {
            Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.ERROR,'No student records Found'));
        }
     
        return null;
    }
}