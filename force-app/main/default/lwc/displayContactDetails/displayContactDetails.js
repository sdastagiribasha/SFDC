import { LightningElement, track, wire } from 'lwc';
import fetchContacts from '@salesforce/apex/displayContactDeatilsController.fetchContacts';
/*
    const COLUMNS = [
                        {label: 'Id', fieldName: 'ContactId', type: 'Id'},
                        { label: 'First Name', fieldName: 'FirstName', type: 'text'},
                        { label: 'Last Name', fieldName: 'LastName', type: 'text' },
                        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
                        { label: 'Email', fieldName: 'Email', type: 'email' }
                    ];
                    */
export default class DisplayContactDetails extends LightningElement {

    //@track columns = COLUMNS;
    @track contactSearch = '';
    @track contactList = [];
    @track error;

    @wire(fetchContacts,{contName:'$contactSearch'})
    wiredContacts({error,data}) {
        if(data) {
            this.contactList = data;
        }
        else if(error) {
            this.error = error;
        }
    }


    handleKeySearch(event) {
        this.contactSearch = event.target.value;
        
    }

}