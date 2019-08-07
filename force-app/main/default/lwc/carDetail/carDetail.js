import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class CarDetail extends NavigationMixin(LightningElement) {

    @api car;

    fullDetails(){
        this[NavigationMixin.Navigate]({
            type: "standard__recordPage",
            attributes :{
                recordId : this.car.data.fields.Id.value,
                objectApiName : "Car__c",
                actionName : "view",
            }
        });
    }

    get carName(){
        try{
            return this.car.data.fields.Name.value;
        }catch(error){
            return 'NA';
        }
    }

    get ownerName(){
        try{
          return this.car.data.fields.Contact__r.value.fields.Name.value;
        } catch(error){
          return 'NA';
        }
      }
    
      get type(){
        try{
          return this.car.data.fields.Car_Type__r.value.fields.Name.value;
        } catch(error){
          return 'NA';
        }
      }
    
      get buildYear(){
        try{
          return this.car.data.fields.Build_Year__c.value;
        } catch(error){
          return 'NA';
        }
      }
    
      get perDayRent(){
        try{
          return this.car.data.fields.Per_Day_Rent__c.value;
        } catch(error){
          return 'NA';
        }
      }
    
      get mileage(){
        try{
          return this.car.data.fields.Mileage__c.value;
        } catch(error){
          return 'NA';
        }
      }
    
      get pictureUrl(){
        try{
          return this.car.data.fields.Picture__c.value;
        } catch(error){
          return 'NA';
        }
      }
}