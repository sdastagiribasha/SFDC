//Display Salary Percentage Calculator
public class PercentageCalculator 
{
    public decimal experiance {set;get;}
    public decimal salary	  {set;get;}
    public decimal bonus	  {set;get;}
    public void displayCalc()
    {
        if(experiance!=null && experiance>0)
        {
            if(experiance>5)
            {
                salary=50000;
                bonus=salary*0.10;
            }
            else
            {
                salary=30000;
                bonus=salary*0.10;
            }
            apexpages.Message msg = new apexpages.Message(apexpages.Severity.CONFIRM,'Success');
            apexpages.addMessage(msg);
        }
        else
        {
            apexpages.Message msg1 = new apexpages.Message(apexpages.Severity.ERROR,'Experiance value Must be Entered');
            apexpages.addMessage(msg1);
        }
    }
}