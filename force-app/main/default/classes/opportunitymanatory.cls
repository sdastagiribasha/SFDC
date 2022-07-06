public class opportunitymanatory 
{
    //count stageName like Prospecting,Qualification,Closed Won and store in account object
    public static void counting(list<Opportunity> opp)
    {
        set<id> Accids = new set<id>();
        for(Opportunity o :opp){
            Accids.add(o.Accountid);
        }
        //count the name from opportunity group by stagename and Account.Name
         AggregateResult[] groupresults  = [select  StageName,Account.Name allow, count(Name) cname from opportunity 
                                            where Accountid in :Accids   group by StageName,Account.Name];
                 map<string,integer> sgcount  = new map<string,integer>(); 
        		 for(AggregateResult  arc : groupresults )
        {
            String accId=(String)arc.get('allow');
			system.debug(accId);            
            String stg=(String)arc.get('StageName');
            	system.debug(accId); 
             If(!sgcount.containsKey(accId+stg))
             {
            	Integer i=(Integer)arc.get('cname');    
            }
             Integer i=(Integer)arc.get('cname');
            sgcount.put(accId+stg,i);
		}
        list<Account> acstgc = [select Name,stageclosed_count_c__c,stage_prospecting__c,stage_qualification__c from account];
         List<Account> aclist=new List<Account>();
        	for(Account a:acstgc)
            {
               If(sgcount.containsKey(a.Name+'Prospecting'))
                 	{
            	    a.stage_prospecting__c=sgcount.get(a.Name+'Prospecting');
            		}
                if(sgcount.containskey(a.Name+'Qualification'))
                {
                    a.stage_qualification__c = sgcount.get(a.Name+'Qualification');
                }
                if(sgcount.containskey(a.Name+'Closed Won'))
                {
                    a.stageclosed_count_c__c = sgcount.get(a.Name+'Closed Won');
                }
                aclist.add(a);
                
            }
        	update aclist;
    }
}