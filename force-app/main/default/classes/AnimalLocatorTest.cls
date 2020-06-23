@isTest 
public class AnimalLocatorTest {
@isTest static void AnimalLocatorMock() {
    // Set mock callout class 
    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock()); 
    // This causes a fake response to be sent 
    string result  = AnimalLocator.getAnimalNameById(1);
    // Verify that the response received contains fake values
    system.debug('result-->>'+ result);
     String expectedResult = 'chicken';
        System.assertEquals(result,expectedResult );

    
   
   
}
}