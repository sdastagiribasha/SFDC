public class ContactOldNew 
{
	public static void oldNewvaluesofcontact(Map<id,contact> oldMap,Map<id,contact> NewMap)
    {
        for(id key: oldMap.keyset())
        {
            Contact old = oldMap.get(key);
            contact new1 = newMap.get(key);
            if(old== new1)
            {
               new1.addError('Already this record was existed');
            }
            else
            {
              new1.LastName=old.LastName+1;
            }
        }
    }
}