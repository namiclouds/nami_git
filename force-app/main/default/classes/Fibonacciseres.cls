public class Fibonacciseres {
    public void Fibonacci(integer num ){
       // if (num == 1 || num==2)
           // system.debug ('v ' +1);
        for ( integer j= 1; j<=num; j++){
                integer f=1 , f1=1 , f2=1 ;
                    for ( integer i=3 ; i<j ; i++){
                        f2 = f+f1; 
                        f= f1 ;
                        f1=f2;
                    }
           system.debug ('v '+ f2);
      }
        
            
            }
}