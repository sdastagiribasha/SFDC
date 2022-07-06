public class AuraContactRecordsdisplay 
{
	@AuraEnabled
    public static list<contact> cclist()
    {
        list<contact> cc=[select id,lastname,firstname,email from contact];
        return cc;
    }
}