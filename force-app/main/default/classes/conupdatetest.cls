@istest
public class conupdatetest {
     @testsetup
    public static void datafactory () {
        account a= new account();
        a.Name= 'bombay hospital';
        a.Billingcity='banglore';
        a.billingstreet='marathalli';
        a.billingstate='karnataka';
        a.billingcountry='India';
        insert a;}
    @istest
    public static void testprepare (){
        contact c= new contact();
        c.firstname ='jay';
        c.LastName='Mandal';
        c.CurrencyIsoCode='USD';
        c.Phone = '98765298';
        /*c.MailingCity='';
        c.MailingStreet='';
        c.MailingCountry='';
        c.MailingState='';
        insert c;*/
   account acc = [select Id,Billingcity,billingstreet,billingstate,billingcountry from account Limit1];   
        c.AccountId= acc.Id;   
        insert c;
   contact con = [select Id, MailingCity,MailingStreet,MailingCountry,MailingState from contact]; 
        system.assertequals(con.MailingState,  acc.Billingstate);
        system.assertequals(con.MailingCity,  acc.Billingcity);
        system.assertequals(con.MailingCountry,  acc.billingcountry);
        system.assertequals(con.MailingStreet,  acc.billingstreet);
        
        
        
        

}
}