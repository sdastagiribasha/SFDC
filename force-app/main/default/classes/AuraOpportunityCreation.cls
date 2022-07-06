//How to Insert the Contact record Trough Lighnting
//How to Pass the Sobject as The Parameters in Lightning
public class AuraOpportunityCreation 
{
	@AuraEnabled
    public static string displayRecords(Opportunity opty)
    {
        string result;
        try
        {
             insert opty;
            result ='operation Success'+ opty.id;
        }
        catch(Exception e)
        {
            result='operation Failed'+e.getMessage();
        }
        return result;
    }
}