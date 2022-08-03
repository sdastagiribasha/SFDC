//On Account create a default contact every time an account is created. 
trigger AccountCreateContact on Account (after insert)
{
    list<contact> cclist = new list<contact>();
    for(Account a :Trigger.New)
    {
        contact c = new contact();
        c.accountid=a.id;
        c.lastname=a.name;
        cclist.add(c);
     }
    insert cclist;
}