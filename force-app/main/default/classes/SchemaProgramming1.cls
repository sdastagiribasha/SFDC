//Display all Objects in your org
public class SchemaProgramming1 
{
    public Map<string,schema.SObjectType> objMap {set;get;}
    public List<string> names                    {set;get;}
    public SchemaProgramming1()
    {
        objMap =schema.getGlobalDescribe();
        names = new list<string>();
       set<string> objnames = objMap.keySet();
        names.addAll(objnames);
    }
}