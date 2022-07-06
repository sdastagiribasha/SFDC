//Display Account industry picklist values
public class SchemaProgramming3 
{
    list<string> values {set;get;}
    public SchemaProgramming3()
    {
       values= new list<string>();
       schema.DescribeFieldResult result = Account.industry.getDescribe();
        if(result.getType()==schema.DisplayType.PICKLIST)
        {
            list<schema.PicklistEntry> PicklistValues = result.getPicklistValues();
            for(schema.PicklistEntry p: picklistvalues)
            {
              values.add(p.getLabel()); 
            }
        }
    }
}