import { LightningElement, wire } from 'lwc';
import fetchAccounts from '@salesforce/apex/AccountwiretopropertyExampleController.fetchAccounts';
export default class WiretoPropertyExample extends LightningElement {

    @wire (fetchAccounts) accounts;
    
}