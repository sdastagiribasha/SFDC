// Whenever new Account is created with Industry as EDUCATION and RATING as Warm.
//  Then create new opportunity with Opportunity name as account name and other details.
trigger OpportunityWithAccount on Account (before insert)
{
    list<opportunity> opplist = new list<opportunity>();
    for(Account a: Trigger.New)
    {
        if(a.Industry=='Education' && a.Ownership=='other')
        {
            opportunity op = new opportunity();
            op.Id=a.Id;
            op.Name=a.Name;  
            op.Type='NewCustomer';
            op.CloseDate=system.today()+15;
            op.StageName='Prospecting';
            opplist.add(op);
        }      
    }
    insert opplist;
}