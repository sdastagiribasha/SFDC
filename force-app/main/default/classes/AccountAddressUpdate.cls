public class AccountAddressUpdate
{
    public Account listofAccount;
    public contact listofContact;
	public void display(string id)
    {
       listofAccount =[select Billingstreet,BillingCity,BillingState,BillingCountry from Account where id=:id];
       listofContact =[select MailingStreet,MailingCity,MailingState,MailingCountry from Contact where Accountid=:id];
    }
}