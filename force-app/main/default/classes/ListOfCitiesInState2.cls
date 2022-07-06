//Get list of all cities in a state given the state name as input
public class ListOfCitiesInState2 
{
	public static list<string> displayMethod(string str)
    {
        Map<string,list<string>> maps = new Map<string,list<string>>();
        list<string> apcities = new list<string>();
        apcities.add('Amaravati');
        apcities.add('Kurnool');
        apcities.add('Kadapa');
        apcities.add('Vizag');
        maps.put('Andhrapradesh',apcities);
        
        list<string> kcities = new list<string>();
        kcities.add('silkboard');
        kcities.add('Marathalli');
        kcities.add('ElectronicCity');
        kcities.add('BTM');
        maps.put('Karnataka',kcities);
        
        list<string> citiesmap = maps.get(str);
        system.debug('no of cities:'+citiesmap);
        return citiesmap;
	}
}