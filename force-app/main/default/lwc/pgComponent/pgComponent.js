import { LightningElement,track,wire } from 'lwc';
import getContactList from '@salesforce/apex/ContactPaginationController.getContactList';
export default class PgComponent extends LightningElement {

    @track columns = [

        {label:'Contact Id', fieldName:'Id', type:'Id'},

        {label: 'LastName', fieldName: 'LastName', type: 'Text'},

        {label: 'FirstName', fieldName: 'FirstName', type: 'Text'},

        {label: 'Email', fieldName: 'Email', type: 'Email'},

        {label:'Phone', fieldName:'Phone', type: 'Phone'}

    ];

    @track responseData;

    @track error;


    @wire(getContactList)
    wiredContacts({ error, data }) {
        if (data) {
            console.log('data...'+data);
            this.responseData = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.responseData = undefined;
        }
    }


}