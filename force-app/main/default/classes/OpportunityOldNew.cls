//When ever New Opportunity is Created with the same name then it shouldn't be created.
public class OpportunityOldNew 
{
	public void duplicateNotAllowed(Map<id,Opportunity> oldMap, Map<id,Opportunity> newMap)
    {
        for(id Key :oldmap.keyset())
        {
            opportunity oldvalue = oldmap.get(key);
            opportunity newvalue = newMap.get(key);
            if(oldvalue==newvalue)
            {
                newvalue.addError('Already this name was existed');
            }
            else
            {
                insert newvalue;
            }
        }
    }
}