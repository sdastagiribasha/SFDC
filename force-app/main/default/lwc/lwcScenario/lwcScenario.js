import { LightningElement, track, wire } from 'lwc';
import getSingleContact from '@salesforce/apex/ContactController.getSingleContact';
export default class LwcScenario extends LightningElement {

    @track data;
    @track error;
    @wire(getSingleContact)
    getSingleContact({data,error}) {
        if(data) {
            console.log('data printing' + data);
        }else if(error) {
            console.log('error was showing' + error);
        }
    }

}