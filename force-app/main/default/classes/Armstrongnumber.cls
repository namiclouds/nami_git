public class Armstrongnumber {
    public static void armstrong(integer num){
       integer temp, rem, sum=0;
        temp=num;
         while (num>0){
            rem = math.mod(num, 10);
             num = num/10;
             sum = sum+(rem*rem*rem);
         }
          if(temp==sum)  
    system.debug('armstrong number');   
    else  
        system.debug('Not armstrong number');   

    }}