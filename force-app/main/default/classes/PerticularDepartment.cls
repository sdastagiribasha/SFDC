//Get a list of all students from a partIcular department
public class PerticularDepartment 
{
    public course__c cse{set;get;}
    public transient list<studentMaster__C> stu {set;get;}
    public PerticularDepartment()
    {
        cse= new course__C();
        stu = new list<studentMaster__C>();
    }
    public list<selectoption> getBranches()
    {
        list<selectoption> option = new list<selectoption>();
        //schema.DescribeSObjectResult result = Account.sObjectType.getDescribe();
        Schema.DescribeFieldResult result = course__c.Branches__c.getDescribe();
        
        list<schema.PicklistEntry> pickval = result.getpicklistvalues();
        for(Schema.PicklistEntry sp : pickval)
            {
                option.add(new selectoption(sp.getlabel(),sp.getvalue()));
            }
        return option;
    }
	public pagereference studentFromDept()
    {
        stu = [select name,email__C,courseid__r.Branches__c from studentMaster__C where courseid__r.Branches__c=:cse.Branches__c];
        if(stu.isEmpty())
        {
            //Apexpages.Message msg = new Apexpages.Message(Apexpages.Severity.ERROR,'No records Found');
            //Apexpages.addMessage(msg);
            Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.ERROR,'No records Found'));
        }
        return null;
    }
}