//Write a trigger when a phone number is updated in contact it should get updated in account?
public class ContactPhoneUpdate
{
	public void AccountPhoneUpdate(list<Contact> cc)
    {
        list<id> accountids = new list<id>();
        for(Contact c: cc)
        {
            accountids.add(c.Accountid);
        }

        list<Account> acc =[select name,phone,(select lastName,phone from Contacts) from Account where id in :accountids];
        list<Account> acc1 = new list<Account>();
        map<id,contact> m1=new map<id,contact>();
        for(Account a:acc)
        {
            // this is for list of contact records for single Account
          for(contact c:cc)
          {
              if(c.AccountId==a.id)
              {
                  a.Phone=c.Phone;
                  acc1.add(a);
                  break;
              }
          }
			
            //m1.put(a.id,a.contacts);
        }
/*
        // for Single contact
        
        for(account a1:acc)
        {
           contact c=m1.get(a1.id);
            a1.phone=c.Phone;
            acc1.add(a1);
        }
*/
        update acc1;
    }
}