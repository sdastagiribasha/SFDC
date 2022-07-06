//Write a VF Page and Controller to display contacts based on the logged in user 
//as(sales Agent) owner of the records and send mails to selected contacts on VF Page.
public with sharing class DisplayContactsByLoggedInUser
{
    //public list<Contact> conlist {set;get;}
    //public contact con		   {set;get;}
    //public User userinfo 		   {set;get;}
	public DisplayContactsByLoggedInUser()
    {
        user uinfo=[select id,name from user where id=:userinfo.getUserId()]; 
        System.debug('User information'+ uinfo);
    }
    //For Sending Email Notification
    public void sendMail(list<Contact> con)
    {
     for(Contact c:con)
     {
       Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
        string mail = Userinfo.getUserEmail();
         string [] options = new string[]{mail,c.Email};
	    msg.setToAddresses(options);
        msg.setPlainTextBody('This is for Email Testing of Display contact based Logged in User'); 
        msg.setSubject('Testing');
        Messaging.Email[] email = new Messaging.Email[]{msg};
        Messaging.sendEmail(email);             
      }
    }
}