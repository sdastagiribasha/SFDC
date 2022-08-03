public with sharing class OpportunityController {
   
    //creating Opportunity
    public static void createOpp (List<Opportunity> newOppList) {
        List<Case> caseList = new List<case>();
        for(Opportunity opp: newOppList) {
            if(opp.StageName == 'Closed Won' || opp.StageName == 'Closed Lost') {
                case c = new case();
                c.Opportunity__c = opp.Id;
                c.Status = 'New';
                c.Origin = 'Web';
                caseList.add(c);
            }
        }
        Insert caseList;
    }

    //Updating Opportunity

    //Deleting Opportunity
}
