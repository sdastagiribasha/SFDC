//Get list of all cities in a state given the state name as input
public class ListofCitiesInState
{
	public static list<string> displayCities(string s)
    {
       Map<string,list<string>> mp = new Map<string, list<string>>();
       
        list<string> Apcities = new list<string>();
        Apcities.add('Amaravati');
        Apcities.add('Kadapa');
        Apcities.add('Kurnool');
        mp.put('AndhraPradesh',Apcities);
        
        list<string> TsCities = new list<string>();
        TsCities.add('Shamshabad');
        TsCities.add('JubleeHills');
        TsCities.add('Madhapoor');
        mp.put('Telangana',TsCities);
        list<string> cities = mp.get(s);
        system.debug(cities);
        return cities;
    }
        
}