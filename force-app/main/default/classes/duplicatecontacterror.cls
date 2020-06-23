public class duplicatecontacterror {
    public static void  contactcon(List<contact>newlist){
        Set<Id> newset= new Set<Id>();
        for (contact c :newlist){
          newset.add(c.accountID) ; 
        }
        list <aggregateresult> mylist =  [select  accountID accid, count(ID) contactcount from contact 
                                                 where accountID IN : newset group by accountID ];
       // map<ID,contact> newmap = new map<ID, contact>([select accountID (select ID from contact) from account]);
       map <ID , Integer > newmap = new map <ID, Integer >();
        for (aggregateresult ar : mylist){
            newmap.put ((id)ar.get('accid'), (integer)ar.get('contactcount'));
        }
        for (contact c: newlist){
            if (newmap.get (c.AccountId)>0){
                c.adderror ('can not enter dupliacte value');
            }
        }
    }

}