//Based on the city Display State
public class CityState2 
{
	public static string displayMethod(string str)
    {
        Map<string,string> maps = new Map<string,string>();
        maps.put('Hyderabad','Telangana');
        maps.put('Amaravati','Andhrapradesh');
        maps.put('Bangalore','Karnataka');
        maps.put('Chennai','Tamilnadu');
        string result =maps.get(str);
        system.debug('list of Records:'+result);
        return result;
    }
}