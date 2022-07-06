//Display the all fields of Account
public class SchemaProgramming2 
{
    public list<string> accfields {set;get;}
    public SchemaProgramming2()
    {
        accfields = new list<string>();
        schema.DescribeSObjectResult result = Account.SobjectType.getDescribe();
        Map<string,schema.SObjectField> objfields = result.fields.getMap();
        set<string> accountfields = objfields.keyset();
        accfields.addAll(accountfields);
    }
}