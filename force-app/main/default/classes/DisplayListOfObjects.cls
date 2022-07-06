//Design a VF Page to display list of objects in salesforce. 
public class DisplayListOfObjects
{
    public Map<string,schema.SObjectType> objMap {set;get;}
    public List<string> names                    {set;get;}
    public DisplayListOfObjects()
    {
        objMap = schema.getGlobalDescribe();// it returns the all Sobjects in your Organization.
        names = new list<string>();
        set<string> allobjects = objMap.keySet(); //keySet() Returns a set that contains all of the keys in the map.
        names.addAll(allobjects);
    }
}