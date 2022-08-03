// When a new Account is created  with  Account Type as prospect then Create new Task  for the ‘’dBash” of the record.
trigger TaskCreationForAccountTrigger on Account (before insert)
{
    user u=[select id,name from user where alias='BShai'];
    list<Task> tasklist = new list<Task>();
    for(Account a: Trigger.New)
    {
        if(a.Type=='Prospect')
        {
            Task t = new Task();
            t.WhatId=a.Id;
            t.Priority='High';
            t.Status='in progress';
            t.OwnerId=u.id; //here we are giving the user id
            tasklist.add(t);
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            string [] toaddress = new string[]{'basha.cloudsfdc@gmail.com'}; 
            msg.setToAddresses(toaddress);
            msg.setSubject('Testing for Email Notification through the User');
            msg.setPlainTextBody('Hi This is the Method of Sending Notification');
            Messaging.Email [] email = new Messaging.Email[]{msg};
                Messaging.sendEmail(email);
        }
    }
    insert tasklist;
}