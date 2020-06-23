public class factorial {
    public static void fac(integer num){
        integer f=1;
        for (integer i=2; i<=num; i++){
           f= i*f;
        }
        system.debug('factorial of number'+ f);
    }
}