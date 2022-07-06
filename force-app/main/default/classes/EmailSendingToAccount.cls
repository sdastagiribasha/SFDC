//Create a apex class to send mail to account , and email contains the information(Opportunity Name,
//Stage, Opportunity Line Items Name and Quantity ) about related Opportunities and thier Opportunity Line
//Items using Map using Map instead of nested for loop.

public with sharing class EmailSendingToAccount
{
    public void sendingMail(list<opportunity> opplist)
    {
        list<id> accountids = new list<id>();
        for(opportunity o1:opplist)
        {
            accountids.add(o1.AccountId);
        }
        list<Account> accountlist =[select id,name,(select name,stagename from Opportunities) from Account];
    }
}