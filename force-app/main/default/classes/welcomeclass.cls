public class welcomeclass {
    public static void updateaccount (List<contact> con){
     for (contact c:con ){
         c.Description = 'welcome'+c.firstname;
        }
     
    }
    
}