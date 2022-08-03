trigger UpdateOpportunities on Opportunity (after update)
{
    UpdateOpportunities.updateOpportunityCount(Trigger.New);
}