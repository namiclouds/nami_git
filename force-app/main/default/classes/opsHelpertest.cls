@istest
public class opsHelpertest {
    @testsetup
    public static void datafactory () {
        account a= new account();
        a.Name= 'bombay hospital';
        a.CurrencyIsoCode='USD';
        a.Active__c='Yes';
        insert a;
        List<Opportunity> opps=new List<Opportunity>();
        for(Integer i=1;i<200;i++){
            Opportunity o=new Opportunity();
            o.Name='oppTest '+i;
            o.AccountId=a.Id;
            o.Amount=100;
            o.stagename='Prospecting';
            o.CloseDate=System.today()+10;
            o.CurrencyIsoCode='USD';
            opps.add(o);
        }
        insert opps;    
        
    }
    
    @isTest
    public static void testOppHelper(){
        List<Opportunity> opps=[Select Id, AccountId, Amount from Opportunity];
        Decimal totalOPPAmouuntActual=0;
        for(Opportunity o:opps){
            o.Amount=200;
            totalOPPAmouuntActual+=200; 
        }
        update opps; 
        Account a=[Select Id, 	amount__c from Account];
        system.assertEquals(totalOPPAmouuntActual, a.amount__c);  
    }
    
     @isTest
    public static void testOppHelperNeg(){
        List<Opportunity> opps=[Select Id, AccountId, Amount from Opportunity];
        Decimal totalOPPAmouuntActual=0;
        for(Opportunity o:opps){
            o.Amount=200;
            totalOPPAmouuntActual+=200; 
        }
        update opps; 
        Account a=[Select Id, 	amount__c from Account];
        system.assertNotEquals(totalOPPAmouuntActual, a.amount__c);  
    }
    
}