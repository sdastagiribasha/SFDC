//TRY CATCH and SetSavePoint and RollBack
public class TryCatchExample {
    public integer count {set;get;}
    public integer count1 {set;get;}
    public integer count2 {set;get;}
    public integer count3 {set;get;}
    public list<Account> acclist {set;get;}
    
    public void tcMethod() {
        savepoint sp = Database.setSavepoint();
        try {
           acclist = [select id,name from Account];
            count = acclist.size();
            system.debug('Zero count:' + count);
            
            Account a = new Account();
            a.Name='Australia';
            contact c = new contact();
            c.LastName ='trump';
            c.AccountId=a.id;
            insert a;
            
            Account a1 = new Account();
            a1.Name='Dumbledoor';
            contact c1 = new contact();
            c1.LastName='Donald';
            c1.AccountId=a1.id;
            insert a1;
            acclist = [select id,name from Account];
            count1 = acclist.size();
            system.debug('Frist count:' + count1);
        }catch (Exception e) {
            acclist =[select id,name from Account];
            count2 = acclist.size();
            system.debug('Second count:' + count2);
            Database.rollback(sp);
            acclist =[select id,name from Account];
            count3 =acclist.size();
            system.debug('third count:' + count3);
        }
    }
}