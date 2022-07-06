//Create a field on Account called “need_intel”, checkbox, default off 
//Create a field on Contact called “Dead”, checkbox, default off
//If 70% or more of the Contacts on an Account are Dead, mark the need_intel field to TRUE
public class AccountContactDead 
{
	public static void updated(list<contact> conlist)
    {
        list<id> accountids = new list<id>();
        for(contact cn : conlist)
        {
            accountids.add(cn.Accountid);
        }
        list<Account> accountlist =[select id,name,Need__c,(select id,Dead__c from contacts where Dead__c=true)from Account where id in :accountids];
        
        map<id,integer> cont =new map<id,integer>();
        
        for(account a:accountlist){
            cont.put(a.Id,a.contacts.size());
            system.debug('values of size'+a.contacts.size());
        }
     
     list<account> accn=new list<account>();
        for(Account a1 : accountlist)
        {
          list<contact> con=a1.contacts;
          integer i=con.size();
            system.debug('subu'+i);
          integer i1=cont.get(a1.id);
           system.debug('subbu1'+i1);
            integer result=(i1/i)*100;
            if(result>=70){
                a1.Need__c=true;
            }
            accn.add(a1);           
        }
        update accn;
    }
}