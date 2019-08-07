@isTest
public class DeleteDataTest {

    @TestSetup
    static void makeData(){
        //creating test data first
        CreateData.createPackageData();
    }

    @isTest
    public static void deleteData(){
        Test.startTest();
        List<SObject> accounts = Database.query('SELECT Id, Name FROM Account');
        List<SObject> contacts = Database.query('SELECT Id FROM Contact');
        List<SObject> carTypes = Database.query('SELECT Id FROM Car_Type__c');
        List<SObject> cars = Database.query('SELECT Id FROM Car__c');
        Test.stopTest();

        //before data delete
        System.assert(accounts.size()==1, 'Only 1 account should exist, but found a different value. Total account found:'+accounts.size());
        System.assertEquals('Lightning Training', accounts[0].get('Name'), 'Account Name is different than "Lightning Training"');
        System.assert(contacts.size()==14, '14 contacts should exist, but found a different value. Total contact found:'+accounts.size());
        System.assert(carTypes.size()==4, '4 car type records should exist, but found a different value. Total car types found:'+accounts.size());
        System.assert(cars.size()==14, '14 car records should exist, but found a different value. Total cars found:'+accounts.size());

        //delete all data
        DeleteData.deleteData();

        //get the records again
        accounts = Database.query('SELECT Id, Name FROM Account');
        contacts = Database.query('SELECT Id FROM Contact');
        carTypes = Database.query('SELECT Id FROM Car_Type__c');
        cars = Database.query('SELECT Id FROM Car__c');

        //after data delete
        System.assert(accounts.size()==0, '0 accounts found');
        System.assert(contacts.size()==0, '0 contacts found');
        System.assert(carTypes.size()==0, '0 carTypes found');
        System.assert(cars.size()==0, '0 cars found');
    }
}