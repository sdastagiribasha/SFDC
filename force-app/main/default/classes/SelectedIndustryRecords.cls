// Based on Selected Industry i want to show the Records
public class SelectedIndustryRecords 
{
    public list<Account> acc {set;get;}
    public set<string> ind   {set;get;} 
    public string str        {set;get;}
    public list<Selectoption> options {set;get;}
    public SelectedIndustryRecords()
    {
        acc=[select id,name,industry from Account];
        ind = new set<string>();
        options = new list<Selectoption>();
        for(Account a: acc)
        {
            ind.add(a.Industry);
        }
        for(string s : ind)
        {
            if(s!=null)
            {
                selectoption so = new selectoption(s,s);
                options.add(so);
            }
        }
    }
    public void displayRecords()
    {
       acc=[select id,name,industry from Account where industry=:str]; 
    }
}