/*
    Test class for AllAboutUnitTestController
*/
@isTest
public with sharing class AllAboutUnitTest {
   
    @TestSetup
    static void makeData(){
       
        Account a = new Account();
        a.name='Acco';
        a.No_Of_Contacts__c=1;
        insert a;
        Contact c = new Contact();
        c.AccountId=a.id;
        c.lastname='con';
        insert c;      
        
    }

    static testMethod void sampleMethod(){
        list<Contact> cclist = [SELECT id,lastname,Accountid FROM Contact];
        /*Account a = [SELECT id,name FROM Account];
        update a;
		*/
        Test.startTest();      
        AllAboutUnitTestController.fetchnoofContacts(cclist);
        Test.stopTest();
    }
}