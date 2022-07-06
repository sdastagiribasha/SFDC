//Write a trigger when a phone number is updated in contact it should get updated in account?
public class ContactPhoneUpdateOnAccount 
{
    public static void updatePhone(list<contact> cc)
    {
        list<id> accountids = new list<id>();
        for(contact c:cc)
        {
            accountids.add(c.AccountId);
        }
        list<Account> acc = [select name,phone,(select name,phone from contacts) from Account where id in:accountids];
        list<Account> acc1 = new list<Account>();
        for(Account a:acc)
        {
            for(contact con: cc)
            {
                if(con.AccountId==a.id)
                    {
                        a.Phone=con.Phone;
                        acc1.add(a);
                    }
            }
        }
        update acc1;
    }
}

// for single contact An Account
/*
  Map<id,contact> mp = new Map<id,contact>();
  for(Account a: acc)
	{
		contact c=mp.get(a.id);
		a.phone = c.phone;
		acc1.add(a);
	}
	update acc1;
*/