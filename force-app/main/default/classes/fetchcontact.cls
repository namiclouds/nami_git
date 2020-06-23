public class fetchcontact {
   @AuraEnabled
    public static list<contact> fetchcon(string AccountID){
        list<contact> con =[select Id, firstname, lastname, email , phone from contact where email!=null and accountID =:AccountID ];
        return con;
        
}

}