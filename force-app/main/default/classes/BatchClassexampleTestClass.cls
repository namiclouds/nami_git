//Test class
@isTest
  public class BatchClassexampleTestClass {
        public static testMethod void testRunAs(){       
        Test.startTest();
        MyBatch BC=new MyBatch();
            account ab=new account(name='test');
            insert ab;
            
           DataBase.executeBatch(BC,200);
           Test.stopTest();
            
            string b='Updated using batch apex at: '+system.now();
            System.assertEquals(b, ab.Description);
       }
          }