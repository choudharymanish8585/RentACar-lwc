@isTest
public with sharing class CarExperienceTest {
    @TestSetup
    static void makeData(){
        List<Account> accounts = RentACarTestFactory.createAccounts(new List<String>{'Lightning Training'});
        List<Contact> contacts = RentACarTestFactory.createContacts(new List<String>{'Manish','Shivani','Ashish','Dushyant'}, accounts[0]);
        List<Car_Type__c> carTypes = RentACarTestFactory.createCarTypes(new List<String>{'Luxury','Sports','Van','Compact'});
        List<Car__c> cars = RentACarTestFactory.createCars(carTypes, contacts[0]);
        List<Car_Experience__c> carExperiences = RentACarTestFactory.createCarExperience(cars);
    }

    @isTest
    public static void testGetExperiences(){
        List<Car__c> cars = [SELECT Id FROM Car__c];
        System.assert(cars.size() == 4, 'Total 4 car records should exist');
        List<Car_Experience__c> carExperiences = CarExperience.getExperiences(cars[0].Id);
        System.assert(carExperiences.size()==1, 'Only 1 review exist for the car');
    }
}
