// when ever the stagename is modified to closed won then set the closedate as today
public class OpportunityofTrigger 
{
	public static void oppstage (Map<id,Opportunity> oldmap, Map<id,Opportunity> newmap)
    {
        for(id key :oldmap.keyset()) //Keyset() Returns a set that contains all of the keys in the map.
        {
            opportunity old = oldmap.get(key);
            opportunity newopt = newmap.get(key);
            if(old.StageName!='closed won' && newopt.StageName=='closed won')
            {
                newopt.CloseDate=system.today();
            }
        }
    }
}