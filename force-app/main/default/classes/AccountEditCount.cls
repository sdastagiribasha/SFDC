/*
  First 15 minutes to go thru all questions and ask any doubts about requirements. 
  12-jan-2019- Total time – 2 hours  - Total 100 marks   
  Problem 1 -(25 marks) --Custom object, student master has a field to count number of times it is updated.  

  When a new student record is created the field value will be 0.    
  When student record is updated once it should increment to 1.  When updated next time it should update to 2 and so on…  Write a trigger to keep this field updated with number of times the record has been updated so far.
  When student record is updated (update 2-3 fields out of all the custom fields) find out list of fields where the value has changed and store the old and new value in different object (Create a child custom object with lookup to student master object).  
  This object can contain following custom fields 
  Student master (custom object)  custom fields --  student mail id, phone number, department (picklist) and fullname. 
*/
public class AccountEditCount
{
     public static void noofcounts(list<Account> acc)
    {
       for(Account a: acc)
       {
           if(a.Accountupdate__C == null)
           {
               a.AccountUpdate__c=0;
           }
           else
           {
               a.AccountUpdate__c=a.AccountUpdate__c+1;
           }
           
       }
    }
    public static void displayOldNewvalues(Map<id,Account> ac,list<Account> acf)
    {
      list<contact> cc = new list<contact>();
        for(Account a:acf)
        {
          Account abc = ac.get(a.id);
            if(a.Industry!=abc.Industry)
            {
              contact c = new contact();
                c.AccountId=a.Id;
                c.LastName=a.Name+'copy';
                c.OldValue__c=abc.Industry;
                c.New_Value__c=a.Industry;
                cc.add(c);
            }
        }
        insert cc;
    }
}