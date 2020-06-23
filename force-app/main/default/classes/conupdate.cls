public class conupdate {
    public static void contactupdate1 (list <contact>  newlist){
        set <id> newset = new set <id>();
        for (contact c : newlist){
           newset.add(c.accountID);
        }
    map<ID,account > newmap1 =new map < ID,account>([select ID, Billingcity , billingstreet,billingstate, billingcountry 
                                                     from account where id IN :newset]);
         
        list <contact> contactchange  = new list< contact > ();                                    
        for (contact c : newlist){
            account a = newmap1.get (c.accountID);
            c.MailingStreet=a.BillingStreet;
            c.mailingcity = a.Billingcity;
            c.mailingstate= a.billingstate;
            c.mailingcountry= a.BillingCountry;
            contactchange.add (c);
            
        }
       
        
    }
        
      
   

}