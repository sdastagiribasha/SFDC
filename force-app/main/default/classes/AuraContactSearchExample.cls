//How to Pass Parameters in ApexController Method to JavaScript
public class AuraContactSearchExample 
{
	@AuraEnabled
    public static list<Contact> getContacts(string leadsour)
    {
        list<contact> conlist =[select id,lastname,firstname,LeadSource from contact where LeadSource=:leadsour];
        return conlist;
    }
}