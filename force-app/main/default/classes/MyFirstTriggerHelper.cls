public class MyFirstTriggerHelper {
    public static void creatDefaultContact(Set<Id> ids){
        List<Contact> cs=new List<Contact>();
        for(Id id:ids){
            
            Contact c=new Contact();
            c.LastName='DefaultContact';
            c.AccountId=Id;
            c.Description='This contact is created by default from trigger';
            cs.add(c);
            
        }
        insert cs;
       
        
        
    }
}