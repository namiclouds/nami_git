@istest
public class mybatchtest {
 @testsetup
  static void setup() {
 List<Account> Accounts= new List<Account>();
 for(Integer i=0 ;i<100;i++)
{
 Account acc = new Account();
 acc.Name ='testt'+i;
 acc.Description = 'Updated using batch apex at: '+system.now();
 Accounts.add(acc);
}
 insert Accounts;
  }
 static testmethod void test(){
 Test.startTest();
 MyBatch obj = new MyBatch();
 DataBase.executeBatch(obj,200);
 Test.stopTest();
 //System.assertEquals(100, [select count() from account where Name IN :Accounts]);     
 // Verify accounts updated
  List<account> accUpdatedList = [SELECT Id,Name,Description FROM Account where Name like '%testt%'];
 //System.assertequals(100, accUpdatedList.size());
 //system.debug(accUpdatedList[0].description);
  System.assertequals('Updated using batch apex at: '+system.today(),accUpdatedList[0].description);       
    }

}