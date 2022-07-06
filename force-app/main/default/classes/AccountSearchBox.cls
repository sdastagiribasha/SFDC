//Search box for searching records in account object
public class AccountSearchBox 
{
    public string searching {set;get;}
    public list<Account> acc {set;get;}
    public void showRecords()
    {
       acc=[select id,name,industry from Account where name=:searching];
        system.debug(acc);
        if(acc.size()==0)
        {
            Apexpages.addMessage(new Apexpages.Message(Apexpages.Severity.ERROR,'Sorry No Record Found'));
        }
    }
}