//List of all accounts with inputs as the rating and industry as input (input can be a list)
public class ListOfAllAccounts

{
    public static list<Account> show(list<string> rat,list<string> ind)
    {
        list<Account> acc =[select name,rating,industry from Account where rating in :rat and industry in:ind];
       	system.debug(acc);
        return acc;
    }
}