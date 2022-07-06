//what is the Recursive Trigger Example & how to fix this 
public class RecursiveTrigger
{
    public static Boolean runfirst=true;
    public static void recursiveonce()
    {
        if(runfirst==true)
        {
            runfirst=false;
            Account ac = new Account();
            ac.Name='Sfdc';
            ac.Industry='Energy';
            insert ac;
            system.debug('inserting values'+ac);
        }
    }
}