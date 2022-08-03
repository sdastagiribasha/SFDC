trigger contactDuplicateError on Contact (before insert)
{
        list<id> contactnames = new list<id>();
    for(contact c:Trigger.new)
    {
        contactnames.add(c.LastName);
    }
    list<contact> conlist = [select id,lastname,firstname from contact where lastname in:contactnames];
    
    set<id> duplicatvalues = new set<id>();
    for(contact c1:conlist)
    {
        duplicatvalues.add(c1.LastName);
    }
    
    for(contact cc:Trigger.New)
    {
        if(cc.LastName!=null)
        {
            if(duplicatvalues.contains(cc.LastName))
            {
                cc.addError('Already this name was existed,please choose anothe name');
                //cc.LastName.addError('Already this name was existed,please choose anothe name');
            }
        }
    }

}