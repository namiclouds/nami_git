public class Accountupdte {
        public static void accountupdate(map<id,account> newmap, map<id,account> oldmap)
        {
        system.debug('inside method call ');
            set<id> accset=new set<id>();
        for(account acc:newmap.values() ){
            if(acc.phone!= oldmap.get(acc.id).phone) {
            accset.add(acc.id) ;    
            }
            
        }
              system.debug('accset@@'+ accset);
            list<contact> updateconlist= new list<contact>();
            List<contact> conlist=[select id,phone,accountID from Contact where accountID in:accset];
            for(contact c :conlist){
              c.phone= newmap.get(c.AccountId).phone;
                updateconlist.add(c);
            }
         update updateconlist; 
        }
}