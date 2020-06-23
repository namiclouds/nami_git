public with sharing class AWSFileUploadController {
    
    @AuraEnabled
    public static List<Filedata> displayUploadedFilesURL(Id parentId){
    list<Filedata> attdata= new list<Filedata> ();
        for( Attachment__c att : [SELECT Id, File_Name__c, File_URL__c FROM Attachment__c
                WHERE Opportunity__c =:parentId]){
                    attdata.add(downloadFilefromAWS(att.File_URL__c,att.File_Name__c));

                }
          return attdata;
            }
    // This method is used to download the data from AWS
    @AuraEnabled
    public static Filedata downloadFilefromAWS(String strfileurl, String strfileName){
                
        String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
     
        HttpRequest req = new HttpRequest();
        //AWS specific information
        String bucketname = 'namisfdcdata'; //AWS bucket name
        String host = 's3.amazonaws.com:443'; //'s3.amazonaws.com:443'


        String method = 'GET';

        req.setMethod(method);
        system.debug('strfileurl'+strfileurl);
        system.debug( 'endurl='+strfileurl.substringAfter('amazonaws.com/'));
       // req.setEndpoint(endPoint);
        req.setEndpoint('callout:AwsS3/'+strfileurl.substringAfter('amazonaws.com/'));

        //system.debug('Endpoint='+endPoint);
        //create header information
        req.setHeader('Host', bucketname + '.' + host);
        req.setHeader('Access-Control-Allow-Origin', '*');
       // req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
        req.setHeader('Content-Encoding', 'UTF-8');
   //  req.setHeader('Content-type', fileType);
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Date', formattedDateString); 
        req.setHeader('ACL', 'public-read');
        //store file as blob       
       // req.setBodyAsBlob(base64Content);

        //finally send information to AWS        
        Http http = new Http();
        HTTPResponse res = http.send(req);

        System.debug('*Resp:' + String.ValueOF(res.getBody()));
        System.debug('RESPONSE STRING: ' + res.toString());
        System.debug('RESPONSE STATUS: ' + res.getStatus());
        System.debug('STATUS_CODE: ' + res.getStatusCode());

        if(res.getStatusCode() == 200){ 
             
             Filedata f= new Filedata(); 
             f.fileName=strfileName;
             System.debug('fileName: ' + f.fileName );
             f.fileextention= getMIMEtype(strfileName.substringAfter('.'));
             
             System.debug('fileextention: ' +  f.fileextention );
            // f.filedata= res.getBodyasBlob();
             f.filecontent=EncodingUtil.base64Encode(res.getBodyasBlob());
             System.debug('filedata: ' +  f.filedata );

            return f;
        }
        return null;

        
    }
    Public static string getMIMEtype (string filetype) {
        switch on filetype {
            when 'png' {		
                return 'image/png';
            }	
            when 'jpg' {		
                return  'image/jpeg';
            }
            when 'jpeg' {		
                return  'image/jpeg';
            }
            when 'pdf' {		
                return  'application/pdf';
            }
    }
    return null; 

}
    //This method is used to post file to AWS
    @AuraEnabled
    public static boolean uploadFileToAWS(Id parentId,
                                        String strfileName, String fileType,
                                        String fileContent){
        System.debug('parentId=' + parentId);
        System.debug('strfileName=' + strfileName);
        System.debug('fileType=' + fileType);
    

        HttpRequest req = new HttpRequest();
        Blob base64Content = EncodingUtil.base64Decode(EncodingUtil.urlDecode(fileContent, 'UTF-8'));
        String attachmentBody =  fileContent;           
        String formattedDateString = Datetime.now().formatGMT('EEE, dd MMM yyyy HH:mm:ss z');
        String dateString = Datetime.now().format('ddMMYYYYHHmmss');        
        String filename = dateString + '_' + strfileName;
       // filename=EncodingUtil.urlEncode(filename).replace('+','%20');l
       
        //filename=filename.replaceAll('+','%20');
        String path='Opportunity/'+parentId+'/'+filename;
        //AWS specific information
        String key = 'Provide AWS key'; //AWS key
        String secret = 'Provide AWS Secret key'; //AWS Secret key
        String bucketname = 'namisfdcdata'; //AWS bucket name
        String host = 's3.amazonaws.com:443'; //'s3.amazonaws.com:443'
        String host1 = 's3.amazonaws.com';

       
        String method = 'PUT';
        String endPoint = 'https://' + bucketname + '.' + host1 + '/'+ path; 

        /*String method = 'GET';
        String endPoint = 'https://' + bucketname + '.' + host + '/'+ filename; */

        //req.setMethod(method);

        req.setMethod(method);
       // req.setEndpoint(endPoint);
        req.setEndpoint('callout:AwsS3/'+path);

        system.debug('Endpoint='+endPoint);
        //create header information
        req.setHeader('Host', bucketname + '.' + host);
        req.setHeader('Access-Control-Allow-Origin', '*');
        req.setHeader('Content-Length', String.valueOf(attachmentBody.length()));
        req.setHeader('Content-Encoding', 'UTF-8');
        req.setHeader('Content-type', fileType);
        req.setHeader('Connection', 'keep-alive');
        req.setHeader('Date', formattedDateString); 
        req.setHeader('ACL', 'public-read');
        //store file as blob       
        req.setBodyAsBlob(base64Content);
        
        //prepare for signing information
        String stringToSign = 'PUT\n\n' +
        fileType + '\n' +
        formattedDateString + '\n' + '/' + bucketname + '/' + filename;

        String encodedStringToSign = EncodingUtil.urlEncode(stringToSign, 'UTF-8');
        Blob mac = Crypto.generateMac('HMACSHA1', blob.valueof(stringToSign),blob.valueof(secret));
        String signedKey  = EncodingUtil.base64Encode(mac);

        //assign Authorization information
        String authHeader = 'AWS' + ' ' + key + ':' + signedKey;                    
        //req.setHeader('Authorization',authHeader);

        //finally send information to AWS        
        Http http = new Http();
        HTTPResponse res = http.send(req);

        System.debug('*Resp:' + String.ValueOF(res.getBody()));
        System.debug('RESPONSE STRING: ' + res.toString());
        System.debug('RESPONSE STATUS: ' + res.getStatus());
        System.debug('STATUS_CODE: ' + res.getStatusCode());

        if(res.getStatusCode() == 200){
             System.debug('end point: ' + endPoint);
            insertAttachmentRecord (parentId,strfileName,endPoint);
            return true;
        }
        return false;
    }

    //This method inserts file information to Custom Attachment object
    public static void insertAttachmentRecord (Id parentId, String fileName, String fileURL){
        Attachment__c attachment = new Attachment__c();
        attachment.Opportunity__c = parentId;
        attachment.File_URL__c = fileURL;
        attachment.File_Name__c =  fileName;
        insert attachment;                                               
    }

    //This method retrieves Attachment record based on OpportunityId
    @AuraEnabled
    public static List<Attachment__c> displayUploadedFiles(Id parentId){
        return [SELECT Id, File_Name__c, File_URL__c FROM Attachment__c
                WHERE Opportunity__c =:parentId];
    }

}