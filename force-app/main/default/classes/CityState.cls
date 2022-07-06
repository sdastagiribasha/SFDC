//Based on student city, get the state
public class CityState
{
	public static string display(string str)
    {
       Map<string,string> mp = new Map<string,string>();
        mp.put('Hyderabad','Telangana');
        mp.put('Bangalore','Karnataka');
        string listofcities =mp.get(str);
        system.debug(listofcities);
        return listofcities;
    }
}