@isTest
public with sharing class CarSearchResultControllerTest {
    @TestSetup
    static void makeData(){
        List<Account> accounts = RentACarTestFactory.createAccounts(new List<String>{'Lightning Training'});
        List<Contact> contacts = RentACarTestFactory.createContacts(new List<String>{'Manish','Shivani','Ashish','Dushyant'}, accounts[0]);
        List<Car_Type__c> carTypes = RentACarTestFactory.createCarTypes(new List<String>{'Luxury','Sports','Van','Compact'});
        List<Car__c> cars = RentACarTestFactory.createCars(carTypes, contacts[0]);
        List<Car_Experience__c> carExperiences = RentACarTestFactory.createCarExperience(cars);
    }

    @isTest
    public static void testGetCarsWithCarTypeId(){
        Test.startTest();
        List<Car_Type__c> carTypes = [SELECT Id, Name FROM Car_Type__c];
        List<Car__c> cars = CarSearchResultController.getCars(carTypes[0].Id);
        Test.stopTest();
        System.assert(carTypes.size() == 4, 'Total 4 car type records should exist');
        System.assert(cars.size()==1, 'Only 1 car should exist per car type');
    }

    @isTest
    public static void testGetCarsWithoutCarTypeId(){
        Test.startTest();
        List<Car_Type__c> carTypes = [SELECT Id, Name FROM Car_Type__c];
        List<Car__c> cars = CarSearchResultController.getCars(null);
        Test.stopTest();
        System.assert(carTypes.size() == 4, 'Total 4 car type records should exist');
        System.assert(cars.size()==4, 'Total 4 car records should exist');
    }
}
