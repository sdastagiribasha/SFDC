import { LightningElement,track } from 'lwc';
import getAccountList from '@salesforce/apex/PaginationOnAccountController.getAccountList';
export default class ImperativeWithSearchFunctionality extends LightningElement {
    @track COLUMNS = [
        {label : 'Account Id', fieldName: 'Id', type: 'Id'},
        {label : 'Name', fieldName: 'Name', type: 'text'},
        {label : 'Industry', fieldName: 'Industry', type: 'picklist'},
        {label : 'Phone', fieldName: 'Phone', type: 'Phone'},
        {label : 'Type', fieldName: 'Type', type: 'text'}
    ];

@track accounts;    
@track error;
@track AccountSearch;

handleKeyChange(event) {
    this.AccountSearch = event.target.value;
}

handleButtonImperative() {
    getAccountList({searchKey : this.AccountSearch})
            .then(result => {
                this.accounts = result;
                console.log('Account records list:' + this.data);
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.data = undefined;
            });
    }
}