import { LightningElement, wire, track } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';

import CAR_ID from '@salesforce/schema/Car__c.Id';
import CAR_NAME from '@salesforce/schema/Car__c.Name';
import CAR_MILEAGE from '@salesforce/schema/Car__c.Mileage__c';
import CAR_PER_DAY_RENT from '@salesforce/schema/Car__c.Per_Day_Rent__c';
import CAR_BUILD_YEAR from '@salesforce/schema/Car__c.Build_Year__c';
import CAR_PICTURE from '@salesforce/schema/Car__c.Picture__c';
import CAR_CONTACT_NAME from '@salesforce/schema/Car__c.Contact__r.Name';
import CAR_CONTACT_EMAIL from '@salesforce/schema/Car__c.Contact__r.Email';
import CAR_CONTACT_PHONE from '@salesforce/schema/Car__c.Contact__r.HomePhone';
import CAR_CARTYPE_NAME from '@salesforce/schema/Car__c.Car_Type__r.Name';

const fields = [
    CAR_ID,
    CAR_NAME,
    CAR_PER_DAY_RENT,
    CAR_BUILD_YEAR,
    CAR_PICTURE,
    CAR_CONTACT_NAME,
    CAR_CONTACT_EMAIL,
    CAR_CONTACT_PHONE,
    CAR_MILEAGE,
    CAR_CARTYPE_NAME
]

export default class CarDetails extends LightningElement {

    @track carId;
    @track selectedTabValue;
    
    @wire(CurrentPageReference) pageRef;

    @wire(getRecord, { recordId : '$carId', fields})
    car;

    connectedCallback(){
        registerListener('carselect', this.callBackMethod, this);
    }

    callBackMethod(payload){
        this.carId = payload.Id;
    }

    disconnectedCallback(){
        unregisterAllListeners(this);
    }

    tabChangeHandler(event){
        this.selectedTabValue = event.target.value;
    }

    experienceAddedHandler(){
        const carExperienceComponent = this.template.querySelector('c-car-experiences');
        if(carExperienceComponent){
            carExperienceComponent.getCarExperiences();
        }

        this.selectedTabValue = 'viewexperience';
    }

    get carFound(){
        if(this.car.data){
            return true;
        }
        return false;
    }
}