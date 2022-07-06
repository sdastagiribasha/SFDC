public inherited sharing class AuraContactDisplay
{
    public AuraContactDisplay() 
    {

    }
    public static list<contact> conlist()
    {
        list<contact> contactlist =[select id,lastname,firstname from contact];
        return contactlist;
    }
}