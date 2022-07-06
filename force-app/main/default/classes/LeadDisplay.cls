//in lead object field names name,company and with leadsource is web display the reords in apex and call vf
public class LeadDisplay
{
   public list<lead> lad {set;get;}    
   public void display()
    {
        lad =[select Name,leadsource,Company from lead where leadsource='web'];
        system.debug('Records :'+lad);
    }
}