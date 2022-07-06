//Let us take a simple example to understand how we can use lightning card in a real example,
public class LightningCardExmple
{
    @AuraEnabled
    public static list<Account> searchMethod(string searching)
    {
        string searchingword = searching+'%';
        list<Account> returnlist =new list<Account>();
        list<Account> acclist =[select id,name from Account where name like :searchingword limit 10];
        for(Account a: acclist)
        {
            returnlist.add(a);
           
        }
         return returnlist;
        
    }
}