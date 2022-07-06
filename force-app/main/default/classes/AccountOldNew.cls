//When ever New Account is Created with the same name then it shouldn't be created.
public class AccountOldNew 
{
	public  static void DuplicateNotAllowed(Map<id,Account> oldMap, Map<id,Account> newMap)
    {
        for(id key :oldMap.keyset())
        {
            Account old = oldMap.get(key);
            Account new9 = NewMap.get(key);  
            if(old== new9)
            {
               new9.AddError('Already this record existed');
            }
            else
            {
                new9.Name=old.Name+1;
            }
        }
    }
}