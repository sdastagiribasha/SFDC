/*-------------------------------------------------------------------------------------------------
    Author:             Dastagiri Basha Shaik
    Date:               18-03-2022
    Version:            1.0
    Test Coverage       95%
    Description:        This class is used as Test calss for 
                        CustomDateController.
    Ticket:             VCASF-191
    
    History
    ======================                                       
   ----------------------------------------------------------------------------------------------------*/
   @isTest
   private class CustomDateControllerTest {
   
       @TestSetup
       static void makeData(){
        Account acc = new Account();
           acc.Name = 'Test Account';
           acc.AnnualRevenue=1000000;
           insert acc;
       }
       @isTest
       public static void testupdateLastModified() { 
           List<Account> accList = [SELECT Id FROM Account];     
           Test.startTest();
           CustomDateController.updateLastModified(accList);
            Test.stopTest();
       }
   }