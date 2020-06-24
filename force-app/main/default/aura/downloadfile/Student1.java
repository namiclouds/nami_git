public class Student1{
    public static void main(String[] args){
        System.out.println("Enter String to Reverse");
        Student1 S1=new Student1();
        String Reversestr=S1.reverseString("Abha kiran");
        System.out.println("Reverse String="+Reversestr);
    }
    public String reverseString(String input) {
        String reverse="";
        for(int i=input.length()-1;i>=0;i--){
            reverse=reverse+input.charAt(i);
        }
        System.out.println("reverseString is ");
        return reverse;
    }
    }