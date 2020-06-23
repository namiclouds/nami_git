public class LatestAccount {
      @AuraEnabled
    Public static account LatestAccount1()  
    {
        account acc1= new account ();
        acc1=[select id, Name, phone from account order by Createddate desc limit 1];
        return acc1;
        
    }

}