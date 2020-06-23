@isTest
public class Testdatafactory {
  public  static list <Account>GenerateAccount(integer numAcc) {
            List<Account>acclistToGenerate = new List<Account>();
            For(integer i=0; i<numAcc; i++){
                Account  acctoGenerate= new Account(Name= 'test Account'+ i);
                acclisttogenerate.add(acctoGenerate);
            }
            Return acclisttogenerate;
        }      

}