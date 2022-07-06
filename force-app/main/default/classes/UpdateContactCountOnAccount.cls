//Write a Trigger to update contact count in account, where contacts are more than 10. 
public class UpdateContactCountOnAccount
{
    public static void displaycount(list<contact> contactlist)
    {
        set<id> contactids = new set<id>();
        for(contact c:contactlist)
        {
            contactids.add(c.id);
        }
        /*
         list<Sobject> sobj=[select Account.name,count(accountid) contactcount from contact 
                            group by Account.name having count(accountid)>10];
        */
         list<Sobject> sobj1=[select count(id) contactcount from contact where id in:contactids
                            group by AccountId having count(id)>10];
        
    }
}