/* To find the Order of Apex class Execution*/
public class ExampleofApex {

    /* static block start here*/
    static {
        system.debug('inside of the static block');
    }
	/*Static block ends here*/
    
    /*Default block start here*/
    {
        system.debug('Default of the block');
    }
    /* Default block ends here*/
    
    /*Constructor without parameters method start here*/
    public ExampleofApex() {
        system.debug('Constructor without parameters:');
    }
    /*constructor without parameters method ends here*/
    
	/*constructor with single parameter method start here*/    
    public ExampleofApex(string name) {
        system.debug('constructor with one Parmeters'+ name);
    }
    /*constructor with single parameter method ends here*/
    
    /*constructor with two parameters method start here*/
    public ExampleofApex(string sname,integer num) {
        system.debug('constructor with two Parmeters'+num);
    }
    /*constructor with two parameters method ends here*/
    
    /*constructor with three parameters method start here*/
    public ExampleofApex(string s1,integer i1,double val) {
        system.debug('constructor with three Parmeters' +val);
    }
    /*constructor with three parameters method ends here*/
}