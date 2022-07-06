// Based on Record id (using LDS)create Qucikaction Button link  I want to update the Status of Case and delete the case also 
public class AuraCaseLDS 
{
	@AuraEnabled
    public static list<Case> updateCase()
    {
        list<Case> caselist =[select id,status from Case];
        return caselist;
    }
}