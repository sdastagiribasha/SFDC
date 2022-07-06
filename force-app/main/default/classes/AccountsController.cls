//Follow the steps below to create a search bar key to search Account name using Salesforce Lightning Component
public class AccountsController 
{
    @AuraEnabled
    public static List <Account> getAccounts() 
    {
         return [SELECT id,name,Type,Industry,Phone FROM Account ORDER BY createdDate ASC];
        
        /*
       list<Account> acclist =[select id,name,type,phone from Account order by createdDate ASC];
        return acclist;
		*/
    }  
    
    @AuraEnabled
    public static List<Account> findByName(String searchKey)
    {
        /*
        String name =  + searchKey + '%';
        return [SELECT id, name, phone,type FROM Account WHERE name LIKE :name];
       */
        string name = + searchkey + '%';
       list<Account> acclist =[select id,name,type,industry,phone from Account where name like :name];
        return acclist;
    }
        
    @AuraEnabled
    public static Map<string,string> getIndustryFieldValue()
    {
        Map<string,string> options = new Map<string,string>();
        schema.DescribeFieldResult fieldresult = Account.Industry.getDescribe();
        list<Schema.PicklistEntry> pvalues = fieldresult.getPicklistValues();
        for(schema.PicklistEntry p : pvalues)
        {
            options.put(p.getValue(),p.getLabel());
        }
        return options;
    }
}