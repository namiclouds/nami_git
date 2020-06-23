public class contacthelper {
    public static void updateaccount (list<Contact> con){
       set<id> accids= new set<id>();
        for (Contact co:con){
            accids.add(co.accountid);
        }
        List<aggregateresult> ars = [Select Accountid accid, count(id) countA 
                                    from contact
                                    where Accountid IN :accids
                                    group by Accountid];
        Map<ID,Account> accmap = new map<ID,Account> ([select ccount__c from account where id IN:accids]);
         for (Aggregateresult ar:ars){
            accmap.get((Id)ar.get('accid')).ccount__c= (integer)ar.get('countA');
        }
       Update accmap.values();
    }
        
      
    }