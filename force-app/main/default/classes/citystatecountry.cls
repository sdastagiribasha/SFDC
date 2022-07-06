public class citystatecountry 
{
    //Method will build a Country to State map and State to City Map by reading Country__c object once and 
    //validates incoming list of Accounts address.
    //First country value is validated against Country__c object. If it matches, then State value is validated against entered country.
    //If State matches with entered country, then entered city is validated against entered state.
    public static Void Accountinformation(List<Account> AccountList)
    {
        map<string,list<string>> CountryStateMap=new map<string,list<string>>();
        map<string,list<string>>StateCityMap=new map<string,list<string>>();        
        //assuming country will have state and city values and state will not be duplicated
        list<CitySateCountry__c> Countries = [Select name,city__C,State__c, country__C From CitySateCountry__c];
        //build country state map
        for (CitySateCountry__c Country:Countries)
        {
            if(CountryStateMap.ContainsKey(Country.Name))
            {
                list<String> States = CountryStateMap.get(Country.Name);
                States.add(Country.State__c);
            }
            else
            {
                list<String> tmpStateList = new list<String>();
                tmpStateList.add(Country.State__c);
                CountryStateMap.put(Country.Name, tmpStateList);
            }
        }
        //build state city map            
        for (CitySateCountry__c tmpCountry:Countries)
        {
            if(StateCityMap.ContainsKey(tmpCountry.State__c))
            {
                list<String> Cities = StateCityMap.get(tmpCountry.state__c);
                Cities.add(tmpCountry.City__c);
            }
            else
            {
                list<String> tmpCityList = new list<String>();
                tmpCityList.add(tmpCountry.City__c);
                StateCityMap.put(tmpCountry.State__c, tmpCityList);
            }
        }       
        //system.debug(CountryStateMap);
        //system.debug(StateCityMap);        
        //Validate incoming Account(s) address        
        Boolean StateMatches=False;
        Boolean CityMatches=False;
        for(Account Account:AccountList)
        {            
            //Assuming Country, State & City are mandatory fields
            if(Account.BillingCountry==null || Account.BillingState==null || Account.BillingCity ==null)
            {
                account.addError('Account should have country, state and city values');
                break;
            }
            if(CountryStateMap.ContainsKey(Account.BillingCountry))
            {
                //get state list
                list<String> States = CountryStateMap.get(Account.BillingCountry);
                //loop through the states and check if the entered state for account is matching with any states for the country
                for(String StateName: States)
                {
                    if(StateName==Account.BillingState)
                    {   
                        //get city list
                        list<String> Cities = StateCityMap.get(Account.BillingState);
                        //loop through the cities and check if the entered city for account is matching with any cities for the entered state
                        for(String CityName: Cities)
                        {
                            if(CityName==Account.BillingCity)
                            {
                                CityMatches=True;
                                break;
                            }                            
                        }
                        if(CityMatches==False)
                        {
                            account.addError('Entered city does not matches with entered state');
                        }
                        StateMatches=True;
                        system.debug('State matches: ' + StateMatches);
                        break;                        
                    }                    
                }
                if(StateMatches==False)
                {
                    account.addError('Entered state does not matches with entered country');
                }
            }                      
        }         
    }
}