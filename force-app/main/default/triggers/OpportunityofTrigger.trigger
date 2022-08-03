trigger OpportunityofTrigger on Opportunity (before update) 
{
/*  for(Opportunity op: Trigger.New)
    {
        if(op.StageName=='Prospecting')
        {
            op.StageName='closed won';
        }
        else if(op.StageName=='closed won')
        {
            op.addError('Error Message');
        }
    }
*/

OpportunityofTrigger.oppstage(Trigger.Oldmap,Trigger.newmap);  
}