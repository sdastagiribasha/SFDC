//Create Custom Visualforce Page to create Contact using fields First Name, Last Name, Data of Birth, Email. 
//Override new contact button on list view page with this visualforce page.
//In Apex Code, check if there is any contact exits with same First Name, 
//Last Name and Date of Birth. If exits, do not create contact and open display details page with existing contact details 
//and display message at top of screen ‘Contact exists with same details. Please use this contact’.


public class customContactButton
{
    public contact con				   {set;get;}
    public list<contact> listofcontacts{set;get;}
    public customContactButton(Apexpages.StandardController sc)
    {
        //this.con = (Contact)sc.getRecord();
        con = new contact();
    }
    public pagereference saverecord()
    {
       listofcontacts =[select lastName,FirstName,Birthdate,Email from contact where 
                        lastname=:con.LastName and firstname=:con.FirstName and birthdate=:con.Birthdate and email=:con.Email];
        
    	if(listofcontacts.size()!=0)
        {
            Apexpages.addMessage(new ApexPages.message(Apexpages.Severity.ERROR,'Contact exists with same details. Please use another contact'));
        	return null;
        }
        else
        {
            insert con;
            Pagereference pr = new Pagereference('/'+con.id);
            pr.setredirect(true);
            return pr;
        }
    }
}