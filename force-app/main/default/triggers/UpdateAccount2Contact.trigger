//When ever Account phone numer is changes then Automatically Account related contact phone number also should be changed.
trigger UpdateAccount2Contact on Account (after update) 
{
    for(Account a:Trigger.New)
    {
        list<contact> cclist = new list<contact>();
        for(contact c:a.contacts)
        {
            if(c.AccountId==a.Id)
            {
                c.phone=a.Phone;
                cclist.add(c);
            }
            
        }
        update cclist;
    }
}