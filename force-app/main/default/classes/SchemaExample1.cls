//To get the contact leadsource values
public class SchemaExample1 
{
    public list<selectoption> valuesofLead{set;get;}   
	public schemaExample1()
    {
        valuesofLead = new list<selectoption>();
        schema.DescribeFieldResult result = contact.Leadsource.getDescribe();
        list<schema.PicklistEntry> entry = result.getpicklistvalues();
        for(schema.PicklistEntry p:entry)
        {
            valuesofLead.add(new selectoption(p.getLabel(),p.getValue()));
        }
    }
}