import { LightningElement, track, wire } from 'lwc';
import listOfAccounts from '@salesforce/apex/AccountManager.listOfAccounts';
export default class RestAPIAccountFetching extends LightningElement {

@track data;
@track error;

@wire(listOfAccounts)
wiredAccounts ({data,error}) {
    if(data) {
        this.data = data;
        this.error = undefined;
    }
    else if(error) {
        this.error = error;
        this.data = undefined;
    }
}

}