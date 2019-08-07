import { LightningElement, track } from 'lwc';

export default class CarSearch extends LightningElement {

    @track carTypeId = '';
    carTypeSelectHandler(event){
        this.carTypeId = event.detail;
    }
}