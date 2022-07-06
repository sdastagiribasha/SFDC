//Search leads based on Annual Revenue and display fields Lead Name, Company, Industry, Annual Revenue in search results
//Search page should have two input field: Min Revenue, Max Revenue
//On changing the revenue, result should be changed accordingly. Process this activity asynchronously and only search results should be changed.
//Max Revenue should be greater than Min Revenue. Display error message if Max Revenue is greater than Min Revenue
//Values of Min Revenue and Max Revenue should be retained
//Revenue should be a valid number

public class LeadActionfunction 
{
    public integer minimumvalue	{set;get;}
    public integer maximumvalue  {set;get;}
    public list <lead> listofleads{set;get;}
	public void display()
    {
        if(minimumvalue > maximumvalue)
        {
            apexpages.addMessage(new apexpages.Message(apexpages.Severity.ERROR,'minimum value should not be greter than maximum value'));
        }
        else
        {
          listofleads =[select name,Company,status,industry,AnnualRevenue from lead where
                      AnnualRevenue >=: minimumvalue and AnnualRevenue <=: maximumvalue];
        if(listofleads.size()==0)
        {
            apexpages.Message msg= new apexpages.Message(apexpages.Severity.ERROR,'No record found');
            apexpages.addMessage(msg);
        }
        }
    }
}