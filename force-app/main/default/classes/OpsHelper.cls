public class OpsHelper {
    Public static void updateAccount(List<Opportunity> ops){
      set<id> accids = new set<id>();
        for(Opportunity op:ops){
         accids.add(op.accountid);  
        }
      List<Aggregateresult> ars =[Select accountid acid, sum (amount) sumA
                                  from Opportunity
                                  where accountid IN :accids
                                  group by accountid
                                  ];
    // Map<ID,Account> accmap = new map<ID,Account> ([select amount__c from Account where Id IN :accids]);
      list <account> newacc =  new list <account> ();
        for (Aggregateresult ar:ars){
           // accmap.get((Id)ar.get('acid')).amount__c= (decimal)ar.get('sumA');
           account a = new Account ();
            a.id = (id)ar.get('acid');
            a.amount__c= (decimal)ar.get('sumA');
                       newacc.add(a);
                       
        }
       //Update accmap.values();
       update newacc;
    }

}