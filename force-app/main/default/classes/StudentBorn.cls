//Get a list of students born in a particular month
public class StudentBorn
{
    public integer mydateofbirth{set;get;}
    public transient list<studentMaster__c> dateofBirth{set;get;}
    public list<selectoption> getlistofvalues()
    {
        list<selectoption> option = new list<selectoption>();
        option.add(new selectoption('1','January'));
        option.add(new selectoption('2','February'));
        option.add(new selectoption('3','March'));
        option.add(new selectoption('4','April'));
        option.add(new selectoption('5','May'));
        option.add(new selectoption('6','june'));
        option.add(new selectoption('7','july'));
        option.add(new selectoption('8','August'));
        option.add(new selectoption('9','September'));
        option.add(new selectoption('10','october'));
        option.add(new selectoption('11','November'));
        option.add(new selectoption('12','December'));
    return option;
    }
    public pagereference getlisofstudents()
    {
        dateofBirth=[select name,DOB__C from studentMaster__C where CALENDAR_MONTH(DOB__C)=:mydateofbirth];
        if(dateofBirth.isEmpty())
        {
            Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.ERROR,'No student record Found'));
        }
        return null;
    }
    
}