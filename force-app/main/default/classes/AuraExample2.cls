//To calling the Apex method in Lightning javascript controller
public class AuraExample2 
{
    @AuraEnabled
	public static string callingMethod()
    {
        string str = 'This is Apex Method calling into JavaScript';
        return str;
    }
}