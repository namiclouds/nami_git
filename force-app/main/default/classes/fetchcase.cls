public class fetchcase {
    @auraenabled
    public static List<case>  fetchlatestcase(){
      string u = userinfo.getuserid();
     List<case> c = [select Id, caseNumber, subject, status from case where OwnerID =:u order By Priority desc ];
       system.debug('case@@@'+c);
        Return c;
        
    }

}