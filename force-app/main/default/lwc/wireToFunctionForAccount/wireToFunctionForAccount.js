import { LightningElement,track,wire } from 'lwc';
import fetchAccountList from '@salesforce/apex/PaginationOnAccountController.getAccountList';
    const COLUMNS = [
                        {label : 'Account Id', fieldName: 'Id', type: 'Id'},
                        {label : 'Name', fieldName: 'Name', type: 'text'},
                        {label : 'Industry', fieldName: 'Industry', type: 'picklist'},
                        {label : 'Phone', fieldName: 'Phone', type: 'Phone'},
                        {label : 'Type', fieldName: 'Type', type: 'text'}
                    ];
export default class WireToFunctionForAccount extends LightningElement {

    @track columns = COLUMNS;
    @track accountSearch = '';
    @track data = [];
    @track error;

    //Pagination along with input as multiple Search Functionality using WireToFunction
    @wire(fetchAccountList,{searchKey : '$accountSearch'})
    wiredAccount({error,data}) {
        if(data) {
            this.data = data;
            this.error = undefined;
        }
        else if(error) {
            this.error = error;
            //this.data = undefined;
        }
    }

    handleKeyChange(event) {
        this.accountSearch = event.target.value;
    }

}