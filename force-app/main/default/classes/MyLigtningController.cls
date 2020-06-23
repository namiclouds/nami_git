public class MyLigtningController {
    @AuraEnabled
    public static List<account> getAccounts(){
        system.debug('getAccounts is called');
        return [Select Id, Name, Phone from Account LIMIT 50];
    }
}