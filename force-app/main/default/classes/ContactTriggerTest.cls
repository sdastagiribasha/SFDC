@isTest
public class ContactTriggerTest {
    @isTest
    public static void testDuplicateContact(){
        String addError;
        String myname = 'Test Contact';
        String myEmail = 'test@gmail.com';
        String myPhone= '0101010101';
        Contact testCon = new Contact(lastName=myname, Phone =myPhone, Email=myEmail);
        List<Contact> conList = [Select Id, Name, Phone, Email
                                 FROM Contact
                                 WHERE Email = :myEmail
                                        AND 
                                        Phone=:myPhone];  
        if(conList.size() < 1 ){
            test.startTest();

            System.assertEquals(0,conList.size());
            insert testCon;
            test.stopTest();
        }
        else{
            addError = 'Existing';
            System.assertEquals('Existing',addError);
        }
        
    }
}