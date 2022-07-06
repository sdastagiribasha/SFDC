import { LightningElement, wire } from 'lwc';
import fetchAccounts from '@salesforce/apex/AccountwiretopropertyExampleController.fetchAccounts';
export default class AccountwiretopropertyExample extends LightningElement {

    @wire(fetchAccounts) accounts;
    
}