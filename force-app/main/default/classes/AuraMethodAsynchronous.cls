//An asynchronous method may continue to execute after it returns. Use a callback to return a value from asynchronous JavaScript code. 
//See Return Result for Asynchronous Code.
public class AuraMethodAsynchronous 
{
	@AuraEnabled
    public static string serversideController()
    {
        return('Hello am from serverside');
    }
}