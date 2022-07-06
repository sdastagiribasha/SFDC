//How to Insert the Contact record Trough Lighnting
//How to Pass the Sobject as The Parameters in Lightning
public class AuraContactCreation 
{
    @AuraEnabled
	public static string createContact(Contact con)
    {
        string result;
        try
        {
            insert con;
            result='Record Insertion Is SuccessFull'+con.id;
        }
        catch(Exception e)
        {
         result='Record Insertion Failed'+e.getMessage();   
        }
        return result;
    }
    
    public static string creationofContact(contact con)
    {
        string result;
        try
        {
         	insert con;
            result='Insertion of Record was successfull';
        }
        catch(Exception e)
        {
            result='Record insertion Failed'+e.getMessage();
        }
        return result;
    }
}