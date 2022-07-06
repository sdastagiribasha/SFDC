// Record level security : Apex Managed sharing
public with sharing class SharingContact
{
	public static void recordSharing(list<contact> con)
    {
        user u1 =[select id from user where alias='araj'];
        /*list<id> accountids = new list<id>();
        for(Contact c1 : con)
		{
            accountids.add(c1.Id);
        }*/
       List<ContactShare> stn = new List<ContactShare>();
        for(contact c: con)
        {
           ContactShare cshe = new ContactShare();
            cshe.ContactId = c.id;
            cshe.UserOrGroupId = u1.Id;
            cshe.ContactAccessLevel ='Read';
            cshe.RowCause ='Manual';
            stn.add(cshe);
        }
        insert stn;
    }
}