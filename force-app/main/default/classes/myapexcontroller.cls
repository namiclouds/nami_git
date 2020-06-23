public class myapexcontroller {
@AuraEnabled
    public static List<Account> getAccount(string searchkey){
        string likesearch = '%'+ searchkey + '%';
        system.debug('Search key'+searchkey);
    List<Account> mylist= [Select Id, Name from Account where Name Like :likesearch ];
        system.debug('Accounts='+mylist);
    return  mylist;
    }
}