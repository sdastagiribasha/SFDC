public with sharing class PreviousNext
 {
   Integer Recordlimit=10;
   Integer offsetlimit=0;
   Public List<Account> lstAcct {
         get{
                 lstAcct = [select Id,name,Accountnumber,phone from Account Limit :recordLimit OFFSET :offSetLimit ];
                 return lstAcct;
             }set;
     }
         
     Public pagereference Next(){
         offSetLimit = offSetLimit + 4;
         return null;
     }
     
     Public pagereference Previous(){
         if(offSetLimit > 0)
             offSetLimit = offSetLimit - 4;
         return null;
     }
}