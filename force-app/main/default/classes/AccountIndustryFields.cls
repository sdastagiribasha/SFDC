public class AccountIndustryFields 
{
    public list<selectoption> options {set;get;}    
    public AccountIndustryFields()
    {         
        options=new list<selectoption>(); 
        Schema.DescribeFieldResult  c= Account.industry.getDescribe();
        list<schema.PicklistEntry> entry=c.getpicklistvalues();
        for(schema.PicklistEntry c1:entry)
        {
            selectoption s=new selectoption(c1.getvalue(),c1.getlabel());
            options.add(s);
        }            
    } 
}