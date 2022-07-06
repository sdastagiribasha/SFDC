//insert,update,delete,edit,save in one program
public class DMLOperations {
    
    public list<wrapperAccount> wrapAcclist {set;get;}
    public wrapperAccount wrapAcc {set;get;}
    public list<Account> acclist {set;get;}
    public string AcName {set;get;}
    public string AcIndustry {set;get;}
    public integer c {set;get;}
    
    public DMLOperations() {
        wrapAcclist = new list<wrapperAccount>();
        acclist = [select id,name,type,industry,rating from Account where rating='Hot'];
        
        for(integer i=0;i<acclist.size();i++)
        {
            wrapAcc = new wrapperAccount();
            wrapAcc.acc = new Account();
            wrapAcc.acc=acclist[i];
            wrapAcc.flag =false;
            wrapAcclist.add(wrapAcc);
        }
    }
    
    public void addMethod() {
        Account a = new Account();
        a.Name=AcName;
        a.Industry=AcIndustry;
        a.Rating='Hot';
        insert a;
    }
    
    public void editMethod() {
        for(integer i=0;i<wrapAcclist.size();i++)
        {
            if(wrapAcclist[i].flag == True) {
                AcName = wrapAcclist[i].acc.name;
                AcIndustry = wrapAcclist[i].acc.industry;
                c=i;
            }
        }
    }
    
    public void saveMethod() {
        wrapAcclist[c].acc.name = AcName;
        wrapAcclist[c].acc.industry = AcIndustry;
        update wrapAcclist[c].acc;
    }
    
    public void deleteMethod() {
        list<Account> temp = new list<Account>();
        for(integer i=0;i<wrapAcclist.size();i++) {
            if(wrapAcclist[i].flag == True) {
                temp.add(wrapAcclist[i].acc);
            }
        }
        delete temp;
    }
    
    //Writing Wrapper Class Here
    public class wrapperAccount {
        public Account acc {set;get;}
        public Boolean flag {set;get;}
    }
}