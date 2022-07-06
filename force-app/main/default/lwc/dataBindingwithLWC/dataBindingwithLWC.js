import { LightningElement } from 'lwc';

export default class DataBindingwithLWC extends LightningElement {

    datavalue ='LWC Sessions';
    handleclick(event) {
        this.datavalue='part 5';

    }
}