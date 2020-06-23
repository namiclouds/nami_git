public class palindrome {
    public static void palindrom1(integer num){
        integer rem ,qut=num,  sum=0 ;
        while (num>0){
            rem = math.mod(num, 10);
            sum= ((sum*10)+rem);
            num= num/10;
        }
      if (sum==qut)  
       system.debug('number is palindrom');
        else 
             system.debug('number is  not palindrom');
        
    }
    
     public static void stpalindrome(string s ){
           // String revStr = '';
    //for (Integer i = s.length()-1; i >= 0; i--)
   // {
       // revStr += s.substring(i, i+1);
  //  }
    String revStr = s.reverse();

  
    system.debug(revStr );
         if (s.equals(revStr)) 
         { 
             system.debug('string is palindrom');
          } 
         else {
             system.debug('string is not palindrom');
         }
     }}