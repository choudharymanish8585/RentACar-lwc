@isTest
public with sharing class CarSearchFormControllerTest {
    @TestSetup
    static void makeData(){
        List<Account> accounts = RentACarTestFactory.createAccounts(new List<String>{'Lightning Training'});
        List<Contact> contacts = RentACarTestFactory.createContacts(new List<String>{'Manish','Shivani','Ashish','Dushyant'}, accounts[0]);
        List<Car_Type__c> carTypes = RentACarTestFactory.createCarTypes(new List<String>{'Luxury','Sports','Van','Compact'});
        List<Car__c> cars = RentACarTestFactory.createCars(carTypes, contacts[0]);
        List<Car_Experience__c> carExperiences = RentACarTestFactory.createCarExperience(cars);
    }

    @isTest
    public static void testGetCarTypes(){
        Test.startTest();
        List<Car_Type__c> carTypes = CarSearchFormController.getCarTypes();
        Test.stopTest();
        System.assert(carTypes.size() == 4, 'Total 4 car type records should exist');
    }
}
