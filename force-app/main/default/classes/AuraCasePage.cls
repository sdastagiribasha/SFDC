//how to use lightning UI into the Visual force Page
public class AuraCasePage 
{
    public list<case> caselist {set;get;}
	public void displayVf()
    {
        caselist=[select subject,priority,status from case limit 5];
    }
}