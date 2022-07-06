//How can we can call Apex class in Screen flow.
public class AccountAction 
{
	@InvocableMethod(label='Welcome Apexclass' description='This is displaying the Apex class')
    
    /*
    public static list<string> getMessage()
    {
        return new list<string>{'welcome to salesforce flows'};
    }
	*/
    

    public static list<string> getdata(list<string> lname)
    {
        string message = 'welcome to salesforce flows';
        if(lname!= null && lname.size()>0)
        {
            message= 'welcome to salesforce flows: '+ lname.get(0);
        }
        return new list<string>{message};
    }
 /*
    
    public static list<string> displaydata(list<inputdata> data)
    {
        string message = '';
        if(data!=null && data.size()>0)
        {
            inputdata inp = data.get(0);
            message='welcome' + inp.fname + 'your lastname is' + inp.lname;
        }
        return new list<string>{message};
    }
    
	public class inputdata
    {
		@invocableVariable(label='firstname' required ='true' description='your firstname')
        public string fname;
        
        @invocableVariable(label='lastname' required ='true' description='your lastname')
        public string lname;
        
    }
*/
    
}