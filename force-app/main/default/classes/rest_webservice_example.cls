@RestResource(urlmapping='/restdata')
global class rest_webservice_example {
    @Httpget
    global static list<account> getAccount(){
       return [select Name, phone, AccountNumber,Industry from Account];
        
    }
    @HttpPost
    global static list<account> CreateAccount(List<Account> acc){
        /*RestResponse res=RestContext.response; 
        string body= res.responseBody.toString();
        system.Debug('body@@'+ body);
        AccountWrapper accs =(AccountWrapper)JSON.deserialize(body, AccountWrapper.class);
        List<Account> acounts=accs.accounts;*/

        insert acc;
        return acc;
        
    }
    
    Public class AccountWrapper{
       public List<account> accounts;
    }
}