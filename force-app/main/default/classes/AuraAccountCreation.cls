//how to insert the record in Account object throuh Lightning
					//or
// how to Pass Sobjects As Parameters in Lightning
public class AuraAccountCreation
{
    @AuraEnabled 
    public static string CreateAccount(Account acc)
    {
        string result;
        try
        {
          insert acc;
          result='Record Insertion is Succesfull :'+acc.id;
        }
        catch(Exception e)
        {
			result='Record Insertion is Failed'+e.getMessage();	            
        }
        return result;
    }
}