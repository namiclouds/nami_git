public class LeadHelper {
    Public void detectDupLead(List<Lead> leads, Set<String> emails){
        
        List<AggregateResult> rs=[Select count(Id) Idcount, email from Lead Where email IN:emails Group by email];
        Map<String,Integer> countMAp= new Map<String,Integer>();
        for(AggregateResult ar:rs){
           countMAp.put((String)ar.get('email'), (Integer)ar.get('Idcount')); 
        }
        
        for(Lead l:leads){
            if(countMap.get(l.email)>0){
                
              l.addError('This is duplicate Lead');  
            }
        }
        
        
    }
}