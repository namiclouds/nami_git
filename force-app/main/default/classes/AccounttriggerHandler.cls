public class AccounttriggerHandler {
    Public static Void handlerbeforeInsert(List<Account> acclist){
        for(Account a :acclist) {
            a.description= 'New Description';
            }
            }
     Public static Void handlerAfterInsert(List<Account> acclist){
         List<Task> myTask= new List<Task>();
        for(Account a :acclist){
         Task aTask = new Task();
         aTask.OwnerID=a.OwnerId;
         aTask.subject='new Account auto desk';
         aTask.whatid= a.Id;
         aTask.Priority='normal';
         myTask.add(aTask);
         
         
     }
     }
     }