@istest
private class OpsHelpertest1 {
    @testSetup
    public static void setofdata()
    {
       /* List<opportunity> opp=new List [Select accountid acid, sum (amount) sumA
                                  from Opportunity
                                  where accountid IN :accids
                                        group by accountid]; */
    list<account> accs = new list<account>();                               
     Account a1 = new account (name='hp');
     Account a2 = new account (name='dxc');
        accs.add(a1);
        accs.add(a2); 
        insert accs;
    }
    @istest
    public static void testinsert(){
        list<account> accs = [select Id, name from account];
    list<opportunity> opps = new list<opportunity>();
        for (integer i = 0; i<4; i++){
        opportunity o= new opportunity();
            o.Name= 'test'+ i;
            o.CloseDate =System.today();
            o.CurrencyIsoCode = 'USD';
            o.StageName = 'prospecting';
            o.Amount = 200;
            if(i<3){
               o.AccountId = accs[0].id;  
            }else{
                 o.AccountId = accs[1].id;
            }
           
            
            opps.add(o);
           
        }
       insert opps;
        list<account> accs1 = [select Id, name, amount__c from account];
        system.assertEquals(opps[0].amount+ opps[1].amount+opps[2].amount, accs1[0].amount__c );
          system.assertEquals(opps[3].amount, accs1[1].amount__c );
        
    }
    @istest
    public static void testupdate (){
        list<account> accs = [select Id, name from account];
    list<opportunity> opps = new list<opportunity>();
        for (integer i = 0; i<4; i++){
        opportunity o= new opportunity();
            o.Name= 'test'+ i;
            o.CloseDate =System.today();
            o.CurrencyIsoCode = 'USD';
            o.StageName = 'prospecting';
            o.Amount = 200;
            if(i<3){
               o.AccountId = accs[0].id;  
            }else{
                 o.AccountId = accs[1].id;
            }
           
            
            opps.add(o);
           
        }
       insert opps;
        for (opportunity o : opps){
        o.Amount =300;    
        }
        update opps;
        list<account> accs1 = [select Id, name, amount__c from account];
        system.assertEquals(opps[0].amount+ opps[1].amount+opps[2].amount, accs1[0].amount__c );
          system.assertEquals(opps[3].amount, accs1[1].amount__c );
        
    }
@istest
    public static void testdelete(){
        list<account> accs = [select Id, name from account];
    list<opportunity> opps = new list<opportunity>();
        for (integer i = 0; i<4; i++){
        opportunity o= new opportunity();
            o.Name= 'test'+ i;
            o.CloseDate =System.today();
            o.CurrencyIsoCode = 'USD';
            o.StageName = 'prospecting';
            o.Amount = 200;
            if(i<3){
               o.AccountId = accs[0].id;  
            }else{
                 o.AccountId = accs[1].id;
            }
           
            
            opps.add(o);
           
        }
       delete [Select Id from opportunity];
     
        list<account> accs1 = [select Id, name, amount__c from account];
        system.assertEquals(null, accs1[0].amount__c );
          system.assertEquals(null, accs1[1].amount__c );
        
    }

}