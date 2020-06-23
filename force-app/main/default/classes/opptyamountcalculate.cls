public class opptyamountcalculate {
    public static void opptyamoutupadtemethod(List<opportunity> oppty){
   List<account> accupdate = new List<account>();
  // List<opportunity> opptylistupdate = new List<opportunity>();
   set<ID> opptyupdate = new set<ID>();
        for(opportunity opp : oppty){
          opptyupdate.add(opp.AccountId);           
        }
        List<aggregateResult>arr=[select accountId acid,Sum (final_count__c) sumA, sum (count__c) SumB
                                  from Opportunity where accountId IN: opptyupdate group by accountId];

    for(aggregateResult ar :arr){
        account a = new account ();
        a.id= (id)ar.get('acid');
        a.total_sum__c= (decimal)ar.get('sumA');
        a.ccount__c= (decimal)ar.get('sumB');
        accupdate.add(a);
            }  
    update accupdate;
    }
}