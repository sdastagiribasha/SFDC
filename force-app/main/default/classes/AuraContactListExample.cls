//Ex:- Calling List of Records from Serverside Controller(Apex) Method to lightning Javascript Controller
public class AuraContactListExample
{
	@AuraEnabled
    Public static List<Contact> getContacts()
    {
        list<Contact> conlist=[select Id,LastName,FirstName from Contact limit 10];
        return conlist;
    }
}