//Get list of all cities in a state given the state name as input
public class MapExample2 
{
	public static list<string> displaycities (string sta)
    {
        Map<string,list<string>> mapcities = new Map<string,list<string>>();
        list<String> apcities = new list<string>();
        apcities.add('Hyderabad');
        apcities.add('Amaravati');
        mapcities.put('AP',apcities);
        list<string> bangcities = new list<string>();
        bangcities.add('Silkboard');
        bangcities.add('Marathalli');
        mapcities.put('BAN',bangcities);
        
        list<string> citystring =mapcities.get(sta);
        system.debug('Citystring list:'+citystring);
        return citystring;
    }
}