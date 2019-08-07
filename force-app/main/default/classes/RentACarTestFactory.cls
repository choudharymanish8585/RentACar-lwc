public class RentACarTestFactory {

    public static List<Car_Type__c> createCarTypes(List<String> names){
        List<Car_Type__c> carTypes = new List<Car_Type__c>();
        for(String carTypeName : names){
            carTypes.add(new Car_Type__c(Name=carTypeName));
        }
        insert carTypes;
        return carTypes;
    }
    
    public static List<Contact> createContacts(List<String> names, Account acc){
        List<Contact> contacts = new List<Contact>();
        for(String contactName : names){
            contacts.add(new Contact(FirstName=contactName,
                                  LastName=contactName, AccountId=acc.id, Email='testcontact1@lightning.com'));
        }
        insert contacts;
        return contacts;
    }

    public static List<Account> createAccounts(List<String> names){
        List<Account> accounts = new List<Account>();
        for(String accName : names){
            accounts.add(new Account(Name=accName));
        }
        insert accounts;
        return accounts;
    }
    
    public static List<Car__c> createCars(List<Car_Type__c> cts, Contact con){
        List<Car__c> cars = new List<Car__c>();
        Integer i = 0;
        for(Car_Type__c ct : cts){
            //process record here
            cars.add(new Car__c(Contact__c=con.id, Car_Type__c=ct.id, 
                               Per_Day_Rent__c = 100+i,
                               Build_Year__c =2000+i,
                               Name='Car'+i));
            i++;
        }
        insert cars;
        return cars;
    }

    public static List<Car_Experience__c> createCarExperience(List<Car__c> cars){
        List<Car_Experience__c> carExperiences = new List<Car_Experience__c>();
        for(Car__c car : cars){
            //process record here
            carExperiences.add(new Car_Experience__c(Name='Test Experience', 
                                Experience__c='Test Detail Experience', 
                                Car__c = car.Id));
        }
        insert carExperiences;
        return carExperiences;
    }
    
}