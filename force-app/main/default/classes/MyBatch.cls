global class MyBatch implements Database.Batchable<sObject>{
    public Database.QueryLocator start(Database.BatchableContext bc){
     
        return Database.getQueryLocator([Select Id, Name from account where name like '%Testt%']);
    }
    public void execute(Database.BatchableContext bc,List<Account> accs){
        for(Account a:accs){
            a.description='Updated using batch apex at: '+system.now();
        }
        update accs;
    }
    public void finish(Database.BatchableContext bc){
        Id jobId=bc.getJobId();
         
    }
    
 
}