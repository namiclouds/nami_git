public class EncapTest{
    private String name;
    private String idNum;
    private int age;
    public int getAge(){
        return age;
    }
    public String getName(){
        return name;
    }
    public String getIdNum(){
        return idNum;
    }
    public void SetAge(int newAge){
        age=newAge;
    }
    public void SetName(String newName){
        name=newName;
    }
    public void setIdNum(String newId){
        idNum=newId;
    }

public String getEnacpTestDails(EncapTest encapTest ){
    return "EncapTest Name:"+EncapTest.Name+"\n"+"idNum:"+EncapTest.idNum+"\n"+"age:"encapTest.age;
    
    }
    public static void main(String[] args) {
        System.out.println("=============printing called main=====");
        EncapTest E=new EncapTest();
        E.Name="Abha";
        E.idNum="12343ms";
        E.age=20;
        String message=E.getEnacpTestDails(E);
        System.out.println(message);
    }
}
