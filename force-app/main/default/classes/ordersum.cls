public class ordersum { 
    public static void orderupdate(map<id,order> newmap){
        set<id> newccountid= new set<id> ();
        for(order o:newmap.values()){
            newccountid.add(o.accountid);
        }
        list<aggregateresult> mylist=[select sum(TotalAmount) totalsum, accountID accid from Order
                                      where accountID IN :newccountid group by accountID ];
        
        list<Account> newacc = new list<Account>();
        for (aggregateresult ar :mylist){
            account a = new account ();
            a.id= (Id)ar.get('accid');
            a.total_sum__c=(decimal)ar.get('totalsum');
            newacc.add(a);
        }
        update newacc;
    }
    public static void updateopration(map<id, order>newmap, map<id,order>oldmap){
        map<id,order> changeamount = new map<id,order>();
        for (order o: newmap.values()){
            order oldorder = oldmap.get(o.id);
            decimal oldamount = oldorder.TotalAmount ;
            decimal newamount= o.TotalAmount;
            if(oldamount!=newamount){
                changeamount.put(o.id,o);      
            }
            
        }
        orderupdate(changeamount);
    }
    
    
}