// On Opportunity to not let the user insert Opportunities with pass closed Date with following Message “Please enter a future Closed Date”. 
// This can also be implemented by a validation rule but we want a Trigger to be written
trigger OpportunityClosedate on Opportunity (before insert)
{
    for(Opportunity op : Trigger.New)
    {
        if(op.CloseDate<system.today())
        {
            op.addError('Please enter a future Closed Date');
        }
    }
}