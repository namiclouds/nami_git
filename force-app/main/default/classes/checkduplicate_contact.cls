public class checkduplicate_contact {
    public static void checkduplicate(list<contact> con ){
        set<id> newset = new set<id>();
        for (contact c: con) {
           newset.add(c.accountId); 
        }
       list<contact> cont=[select ID ,accountID, lastname from contact where accountID in:newset];
        map<id,set<string>> conmap= new  map<id,set<string>>();
        
        for (contact c : cont){
            conmap.put(c.AccountId, new Set<String>{c.LastName}) ;  
            if(conmap.containsKey(c.AccountId)){
                 conmap.get(c.AccountId).add(c.LastName);
                
            }
            else {
                conmap.put(c.AccountId, new set<string>{c.LastName}); 
            }
              
        }
      map<id,set<string>> newmap= new  map<id,set<string>>();
    
        for (contact c: con){
       set<string> newlst= newmap.get(c.accountId);
       set<string> oldlst = conmap.get(c.AccountId);
            if ((conmap.containskey(c.AccountId) && oldlst.contains(c.LastName))|| (newmap.containskey(c.AccountId) && newlst.contains(c.LastName))){
             c.adderror('conatct already exist with the last name');
            }   
          
            if(newmap.containsKey(c.AccountId)){
                 newmap.get(c.AccountId).add(c.LastName);
                
            }
            else {
                newmap.put(c.AccountId, new set<string>{c.LastName}); 
            }
        }
        }
    public static void checkduplicatecontact(list<contact> con ){
        List<contact> cont =[select Id, lastname  from contact ];
     set<string> oldcontset= new set<string>();
        for (contact c : cont){
         oldcontset.add(c.LastName);
        }
        set<string> newcontset= new set<string>();
        for (contact c :con ){
            if(oldcontset.contains(c.LastName)||newcontset.contains(c.LastName)){
                c.adderror('duplicate contact can not insert') ;  
            }
          newcontset.add(c.LastName);
        }}
        public static void checkduplicateupdate(map<id, contact> newmap, map<id,contact> oldmap){
            set<id> newset= new set<id>(); 
            list<contact> contlistupdate= new list<contact> ();
            for (contact c :  newmap.values()){
                if (c.lastname!=oldmap.get(c.id).lastname){
                newset.add(c.AccountId);
                    contlistupdate.add(c);
                }
            }
           list<contact> cont=[select ID ,accountID, lastname from contact where accountID in:newset and id not in :newmap.keyset()];
              map<id,set<string>> contactmap= new  map<id,set<string>>();
            for (contact c : cont){
            if(contactmap.containsKey(c.AccountId)){
                 contactmap.get(c.AccountId).add(c.LastName);
            }
            else {
                contactmap.put(c.AccountId, new set<string>{c.LastName}); 
            }
            }
            map<id,set<string>> newmap1= new  map<id,set<string>>();
       
       
            for (contact c: contlistupdate){
                 set<string> newlst= newmap1.get(c.accountId);
              set<string> oldlst = contactmap.get(c.AccountId);
   
            if ((contactmap.containskey(c.AccountId) && oldlst.contains(c.LastName))|| (newmap1.containskey(c.AccountId) && newlst.contains(c.LastName))){
             c.adderror('conatct update  already exist with the last name');
            }   
          
            if(newmap1.containsKey(c.AccountId)){
                 newmap1.get(c.AccountId).add(c.LastName);
                
            }
            else {
                newmap1.put(c.AccountId, new set<string>{c.LastName}); 
            }
        }
        }

        }