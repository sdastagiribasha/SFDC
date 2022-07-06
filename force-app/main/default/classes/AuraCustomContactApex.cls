//Pagination in Custom data table to show record and add selected records in lightning component.
public class AuraCustomContactApex 
{
   /*
    @AuraEnabled
    public static list<wrapperclass> getAllContactRelatedToParent(string CurrentAccId)
    {
        string parentAccid;
        list<Wrapperclass> wrapperlist = new list<Wrapperclass>();
        Account acc = [select id,name,phone,parentid from Account where id=:CurrentAccId];
        parentAccid =acc.ParentId;
        list<contact> cclist =[select id,lastname from contact where accountid=:parentAccid];
        for(contact cc:cclist)
        {
            wrapperlist.add(new Wrapperclass(false,cc));
        }
        return wrapperlist;
    }
    */
    @AuraEnabled
    public static void addAllSelectedContact(list<contact> conList,string currentAccId)
    {
        system.debug('Function called'+conList);
        system.debug('currentAccId'+currentAccId);
        list<contact> finalConList=new list<contact>();
        
        for(integer i=0;i<conList.size();i++)
        {
            contact obj=new contact();
            obj.lastName=conList[i].Name;
            obj.phone=conList[i].phone;
            obj.accountId=currentAccId;
            finalConList.add(obj);
        }
        insert finalConList;
    }
}