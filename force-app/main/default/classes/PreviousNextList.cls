//Display the limited listof Records of Account Object through Previous and Next
public with sharing class PreviousNextList
 {
    integer limitvalue=10;
    integer offsetlimit=0;
    public list<Account> acc {
    get{
        acc=[select id,name,industry from Account Limit:limitvalue OFFSET:offsetlimit]; 
        return acc;
       }set;
    }  
    public Pagereference next()
    {
        offsetlimit = offsetlimit+4;
        return null;
    } 
    public Pagereference previous()
    {
        if(offsetlimit >0)
        {
            offsetlimit = offsetlimit-4;
        }
        return null;
    }
}