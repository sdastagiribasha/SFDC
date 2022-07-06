public class Methodwithparameters 
{
    public static string fname;
    public static string lname;
    public static integer age;
	public static void methodCalling()
    {
    	fname='likhit';
        lname='nagesh';
        age=25;
        system.debug('This is the Method Example');
	        
    }
    
    public static void secondMethod(string fn, string ln, integer ag)
    {
        fname=fn;
        lname=ln;
        age=ag;
        system.debug('this is with parameters');
	}
}