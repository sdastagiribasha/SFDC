@isTest

public class FirstTestclass 
{
    @isTest static void methodcalling() // --?1st
    {
        Helloworldsample ho = new Helloworldsample();
        ho.displayMethod();
        system.assertEquals('basha', ho.fristname);
        system.assertEquals('shaik', ho.lastname);
	        
    }
    
}