//How to disply listof contact records based on current logged in user by using lightning 
public class ContactRecordsDisplaying 
{
	@AuraEnabled
    public static list<contact> getcontacts()
    {
        list<contact> conlist =[select id,lastname,firstname,phone from contact ];
        return conlist;
    }
}