//Whenever new case is created with Priority as high 
//Send Acknowledgement email to owner of case, email address aviated after 2 hours. 
//When the status of the case is closed then, confirmation email should sent to customer. 
//Note: write a test class along with class
public class CaseCreation
{
    public static void emailforCase(list<case> caselsit)
    {
        list<case> caselist1 = [select id,status,Origin from Case];
        for(Case c : caselsit)
        {
            if(c.Priority=='high')
            {
                Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
                string mail = UserInfo.getUserEmail();
                string [] Toaddr = new String[]{mail};
                    msg.setToAddresses(Toaddr);
                msg.setPlainTextBody('Dear Owner'); 
                msg.setSubject('Test email');
                Messaging.Email[] email = new Messaging.Email[]{msg};
                    Messaging.sendEmail(email);               
            }
            else if(c.Status=='closed')
            {
                Messaging.SingleEmailMessage msg1 = new Messaging.SingleEmailMessage();
                string[] Toaddr1 = new string[]{c.ContactEmail};
                    msg1.setToAddresses(Toaddr1);
                msg1.setPlainTextBody('Dear Customer');
                msg1.setSubject('Testing Email');
                Messaging.Email [] email = new Messaging.Email[]{msg1};
                    Messaging.sendEmail(email);
            }
        }
    }
}