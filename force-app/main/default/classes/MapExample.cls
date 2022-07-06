//Based on student city, get the state
public class MapExample 
{
	public static string display(string s)
    {
        Map<string,string> mp = new Map<string,string>();
        mp.put('Hyderabad','Telangana');
        mp.put('Chennai','TamilNadu');
        string listofcities=mp.get(s); //To get the input of key based value
        //string listofcityvalues = mp.values(s);
         system.debug(listofcities);
        return listofcities;
    }
}