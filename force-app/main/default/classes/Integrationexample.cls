public class Integrationexample {
    
    
    public static void mymethod1(string name, string city ){
        Http p= new Http();
        httpRequest req = new HttpRequest();
        req.setEndpoint('https://www.google.com/search?q='+name+'&city='+city);
        req.setMethod('GET');
        httpResponse res= p.send(req);
        system.debug('Res--->>'+ res.getBody());
        
        
    }
    
    @AuraEnabled
    public static list<Post_Office__c> Getpostofficedetail(integer pincode ){
        system.debug ('postal deatil calling');
        Http p= new Http();
        httpRequest req = new HttpRequest();
        req.setEndpoint('https://api.postalpincode.in/pincode/'+pincode);
        req.setMethod('GET');
        httpResponse res= p.send(req);
        // List<Postofficewrapper> parseresponse= Postofficewrapper.parse(res.getBody());
        List<Object> lisobj=(List<Object>)JSON.deserializeUntyped(res.getBody());
        Map<String,String> extsalesmap= new map<String,String>();
        for(postoffice_field__mdt pf :[select Id,ext_field__c,sf_field__c from postoffice_field__mdt ]){
            extsalesmap.put(pf.ext_field__c, pf.sf_field__c);                                                      
        }
      
        Map<String,Object> firstelementmap=(Map<String,Object>)lisobj[0];
        system.debug('deserilizeduntyped='+firstelementmap);
        String status=String.valueOf(firstelementmap.get('Status'));
        String message=String.valueOf(firstelementmap.get('Message'));
        List<Object> postoffices=(List<Object>)firstelementmap.get('PostOffice');
        list<Post_Office__c> sfPostoffices =new list<Post_Office__c>();
        for(Object ps:postoffices){
            Post_Office__c Po = new Post_Office__c();
            Map<String,Object> pofiledvaluemap=(Map<String,Object>)ps;
           for(string jsonfield :pofiledvaluemap.keyset()){
             string sffield =extsalesmap.get(jsonfield);
               po.put(sffield,String.valueof(pofiledvaluemap.get(jsonfield)));
            }
            
            
            /*po.Name=String.valueof(pofiledvaluemap.get('Name'));
            Po.BranchType__c = String.valueof(pofiledvaluemap.get('branchtype'));
            Po.Circle__c    =String.valueof(pofiledvaluemap.get('circle'));
            Po.Country__c  =String.valueof(pofiledvaluemap.get('country'));
            Po.Description__c=String.valueof(pofiledvaluemap.get('Description'));
            Po.District__c = String.valueof(pofiledvaluemap.get('district'));
            Po.Division__c   = String.valueof(pofiledvaluemap.get('Division'));
            po.Pincode__c  = integer.valueof(pofiledvaluemap.get('Pincode'));
            po.Region__c  = String.valueof(pofiledvaluemap.get('Region'));
            po.State__c  = String.valueof(pofiledvaluemap.get('State'));*/   
            
            sfPostoffices.add(po);
        }
        system.debug('postofiiceojects='+sfPostoffices);
        List<Postofficewrapper> parseresponse=(List<Postofficewrapper>) System.JSON.deserialize(res.getBody(), List<Postofficewrapper>.class);
        system.debug('parseResponse'+ parseresponse);
        system.debug('Res--->>'+res.getBody());
        /* list<Post_Office__c> Postoffice =new list<Post_Office__c>();
for (Postofficewrapper ls: parseresponse){
if (ls.status=='success'){
for (Postofficewrapper.postoffice Ps: ls.PostOffice){
Post_Office__c Po = new Post_Office__c();
po.Name=              Ps.Name;
Po.BranchType__c = Ps.branchtype;
Po.Circle__c    =Ps.circle;
Po.Country__c  =Ps.country;
Po.Description__c=Ps.Description;
Po.District__c = Ps.district;
Po.Division__c   = Ps.Division;
po.Pincode__c  = integer.valueof(Ps.Pincode);
po.Region__c  = Ps.Region;
po.State__c  = Ps.State;
Postoffice.add(po);
}
}
}
if (Postoffice.size()>0){
upsert Postoffice Name ; 
} 
Return Postoffice;
*/
        return null;   
        
    }
    
}