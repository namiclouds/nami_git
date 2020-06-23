public class showaccount{
    @AuraEnabled
    Public static List<account> searchForAccount(){
         List<account> a = [select ID,Name,Phone,Rating,Owner.name from account LIMIT 100];
        Return a;
    }
    @AuraEnabled
       Public static List<contact> searchForContact(ID accountId){
         List<contact> c = [select ID,FirstName,LastName,Phone from contact where accountId =:accountId];
        Return c;
    }
    
}