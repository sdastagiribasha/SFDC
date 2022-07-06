import { LightningElement, wire } from 'lwc';
import fetchaccountlist from '@salesforce/apex/DynamicLookupController.findAccounts';
export default class DynamicLookupController extends LightningElement {

    Acckey = '';
    @wire(fetchaccountlist,{Acckey : '$searchkey'})
    accounts;

    handlekeychange(event) {
        console.log(event.target.value);
    }
}