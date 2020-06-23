public class removeduplicate {
    public static void remove(string [] b){
        b.sort();
        system.debug(b);
        string [] a=new List<String>();
        integer j=0;
        a.add(b[0]);
        for(integer i=0; i<b.size()-1 ; i++){
            
            if(b[i]!=b[i+1]){
               // j++;
                a.add(b[i+1]);
                
            }    
            }
          for (integer i=0; i<a.size(); i++)  {
                system.debug(a[i]);
                
            }
        }

    }