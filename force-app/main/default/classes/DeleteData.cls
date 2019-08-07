public class DeleteData {

    public static void deleteData(){
        List<Car__c> cars = [SELECT Id FROM Car__c];
        delete cars;
        
        List<Car_Type__c> carTypes = [SELECT Id FROM Car_Type__c];
        delete carTypes;
        
        List<String> emails = new List<String>();
        emails.add('testcontact1@lightning.com');
        emails.add('testcontact2@lightning.com');
        emails.add('testcontact3@lightning.com');
        emails.add('testcontact4@lightning.com');
        emails.add('testcontact5@lightning.com');
        emails.add('testcontact6@lightning.com');
        emails.add('testcontact7@lightning.com');
        emails.add('testcontact8@lightning.com');
        emails.add('testcontact9@lightning.com');
        emails.add('testcontact10@lightning.com');
        emails.add('testcontact11@lightning.com');
        emails.add('testcontact12@lightning.com');
        emails.add('testcontact13@lightning.com');
        emails.add('testcontact14@lightning.com');
        List<Contact> contacts = [SELECT Id FROM Contact WHERE Email IN:emails];
        delete contacts;
        
        List<Account> acc = [SELECT Id FROM Account WHERE Name='Lightning Training'];
        delete acc;
    }
}