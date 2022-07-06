public with sharing class PagereferenceUsingDynamically
 {
     public Account acc{set;get;}
    public PagereferenceUsingDynamically()
     {
         acc = new Account();
    }
    public Pagereference create()
    {
        insert acc;
        Pagereference pr = new Pagereference('/'+acc.id);
        return pr;
    }
}