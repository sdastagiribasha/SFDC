import { LightningElement, track, wire } from 'lwc';
import fetchContacts from '@salesforce/apex/ContactwiretoPropertyController.fetchContacts';
export default class WiretopropertyWithParameterExample extends LightningElement {

    @track fname;
    @wire(fetchContacts,{sname:'$fname'}) contactsdata;
    handlechange(event) {
        this.fname = event.target.value;
        console.log(this.fname);
    }
}