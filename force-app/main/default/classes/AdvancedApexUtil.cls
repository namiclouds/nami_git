public with sharing class AdvancedApexUtil {
    //Method to generate of record 
    public static String objectToJSON(String objName, Id recordId){
        
        sObjectType objType=schema.getGlobalDescribe().get(objName);
        Map<String,Schema.SObjectField> fieldMap=objType.getDescribe().fields.getMap();
        String query='Select';
        for(String fiedlName:fieldMap.keySet()){
            query=query+' '+fiedlName+',';
        }
       query=query.removeEnd(',');
       query=query+' from '+ objName +' Where Id=:recordId LIMIT 1';
        System.debug('Final Query is:'+query);
      	SObject s=Database.query(query);
        system.debug('Data'+s);
        String ObjJSON = JSON.serialize(s);
        System.debug('JSON Data'+ObjJSON);
        
        return ObjJSON;
        
    }
    
    public static Void SendJsoNData(String objName, Id recordId){
        String jsonBody=objectToJSON(objName,recordId);
        String endpoint='';
        HttpRequest request=new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('POST');
        request.setBody(jsonBody);
        Http p=new Http();
        HttpResponse res=p.send(request);
        String response=res.getBody();
		
    }

}