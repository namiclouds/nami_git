public class primenumber{
    public static void prime(integer num){
        for(integer i=1; i<num; i++){
             boolean ISprime = true ;
            for(integer j=2; j<i ; j++){
                //integer reminder=math.mod(i,j);
                if (math.mod(i,j)==0)
                    {
                  ISprime = false ;
                   break ;
            }
        }
           if (ISprime )
            system.debug ('number is prime '+ i);
    }
    }}