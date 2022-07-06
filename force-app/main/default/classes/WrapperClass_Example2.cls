public class WrapperClass_Example2 
{
	public static string secondname;
    public static string secondlastname;
    public static integer secondage;
    public static WrapperClass_Example w1;
    
    public static void displayMethod()
    {
        secondname='AAA';
        secondlastname='BBBB';
        secondage=30;
        w1 = new WrapperClass_Example();
        w1.fname='likhit';
        w1.lname='nagesh';
        
    }
}