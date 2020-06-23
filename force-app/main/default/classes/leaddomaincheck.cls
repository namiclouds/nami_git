public class leaddomaincheck {
    public static void leadcheck(list<lead> newlist){
        set <string> newset = new set<string>();
        for (lead l : newlist){
          newset.add (l.lead_formula__c);
        }
/*list <Aggregateresult> mylist= [select count(id) leadcount, lead_formula__c leaddomain from lead where lead_formula__c IN :newset group by lead_formula__c];
        Map< string,integer> newmap = new map< string,integer> ();
    for (Aggregateresult ar : mylist){
        {
          newmap.put((string)ar.get ('leaddomain'),(Integer)ar.get ('leadcount')) ; 
        }*/
        list<Lead> newlist1 = [select Id, ownerId, lead_formula__c from lead where lead_formula__c IN : newset ORDER BY LastModifiedDate DESC];
        for (Lead l : newlist ){
           // if (newmap.get (l.lead_formula__c) > 0)
                for (lead l1 : newlist1){
                    if (l.lead_formula__c == l1.lead_formula__c){
                     l.OwnerId = l1.ownerID;   
                        break;
                    }
                   
            }
            
        }
    }
        
    }