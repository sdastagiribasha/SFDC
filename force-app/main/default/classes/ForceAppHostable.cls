//Let us create a simple component for inserting contact and create a  tab for the same.
public class ForceAppHostable
{
	@AuraEnabled
    public static contact  creatindRecord(string parentid,string name1,string name2)
    {
        contact c = new contact();
        c.AccountId=parentid;
        c.FirstName=name1;
        c.LastName=name1;
        insert c;
        return c;
    }
}