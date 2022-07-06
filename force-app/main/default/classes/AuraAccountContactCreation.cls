// When ever Account was Created Then Contact Should be Created
public class AuraAccountContactCreation 
{
    @AuraEnabled
	public static boolean createContact(contact con,id accid)
    {
      	boolean flag;
        con.Phone='8886';
        con.AccountId=accid;
        insert con;
        flag=true;
        return flag;
    }
}