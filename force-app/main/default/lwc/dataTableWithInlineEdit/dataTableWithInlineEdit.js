import { LightningElement, track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountRecordsWithDataTable.getAccountList';
import updateRecord from '@salesforce/apex/AccountRecordsWithDataTable.updateRecord';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

    const COLUMNS = [
                        { label: 'Account Id', fieldName: 'Id', type: 'Id', editable: false},
                        { label: 'Account Name', fieldName: 'Name', type: 'text', editable: true},
                        { label: 'Type', fieldName: 'Type', type: 'text', editable: true},
                        { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'Currency', editable: true},
                        { label: 'Phone', fieldName: 'Phone', type: 'Phone', editable: true},
                        { label: 'Website', fieldName: 'Website', type: 'url', editable: true},
                        { label: 'Rating', fieldName: 'Rating', type: 'test', editable: true},
                    ];
export default class DataTableWithInlineEdit extends LightningElement {
    @track  columns = [
        { label: 'Account Name', fieldName: 'Name' ,type: 'text',editable: true},
        { label: 'Phone', fieldName: 'Phone',type: 'text',editable: true},
    ];
    @track error
    @track Datatable
    draftValues
    _datatableresp
    @wire(getAccountList)
    wiredAccount(result) {
        this._datatableresp = result
        if (result.data) {
            this.Datatable = result.data
        } else {
            this.error = result.error
        }
    }
    handleSave(event){
        this.draftValues = event.detail.draftValues;
        alert('draf '+JSON.stringify(this.draftValues))
        updateRecord({acclist: this.draftValues})
         .then( result => {
            console.log( JSON.stringify( "Apex update result: " + result ) )
            if(result === true){
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success!!',
                        message: 'successfully Account has been updated',
                        variant: 'success'
                    })

                );
                this.draftValues = []
                return refreshApex(this._datatableresp);
            } else {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error!!',
                        message: 'something went wrong please try again',
                        variant: 'error'
                    })
                );
            }

         })
    }

}