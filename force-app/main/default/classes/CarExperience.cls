public with sharing class CarExperience {
    @AuraEnabled
    public static List<Car_Experience__c> getExperiences(String carId){
        return [SELECT Id,
                    Name,
                    Experience__c,
                    LastModifiedDate,
                    CreatedDate,
                    CreatedBy.Name,
                    CreatedBy.SmallPhotoUrl,
                    CreatedBy.CompanyName
               FROM Car_Experience__c
               WHERE Car__c  = :carId
               ORDER BY CreatedDate DESC];
    }
}
