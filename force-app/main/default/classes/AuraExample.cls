//To calling the Apex method in Lightning javascript controller
public class AuraExample
{
	@AuraEnabled
    public static string call()
    {
        string result='This is @AuraEnabled Method Calling from Apex';
        return result;
    }
}