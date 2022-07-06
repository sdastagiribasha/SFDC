import { LightningElement, track, wire } from 'lwc';
import fetchAccountList from '@salesforce/apex/PaginationOnAccountController.getAccountList';
    const COLUMNS = [
                        {label : 'Account Id', fieldName: 'Id', type: 'Id'},
                        {label : 'Name', fieldName: 'Name', type: 'text'},
                        {label : 'Industry', fieldName: 'Industry', type: 'picklist'},
                        {label : 'Phone', fieldName: 'Phone', type: 'Phone'},
                        {label : 'Type', fieldName: 'Type', type: 'text'}
                    ];
export default class PaginationExampleForAccount extends LightningElement {

    @track columns = COLUMNS;
    @track accountSearch = '';
    @track data = [];
    @track error;
    @track page = 1;
    @track pagesize = 5;
    @track isPageChanged = true;
    @track startingRecord = 1;
    @track endingRecord = 0;
    @track totalRecountCount = 0;
    @track items = [];
    @track totalPage = 0;

    //Pagination along with input as multiple Search Functionality using WireToFunction
    @wire(fetchAccountList,{searchKey : '$accountSearch'})
    wiredAccount({error,data}) {
        if(data) {
            this.processRecords(data);
            this.error = undefined;
        }
        else if(error) {
            this.error = error;
            //this.data = undefined;
        }
    }

    processRecords(data) {
        this.items = data;
        this.totalRecountCount = data.length;
        this.totalPage = Math.ceil(this.totalRecountCount / this.pagesize);
        console.log('Total Number of page size:' + this.totalPage);
        this.data = this.items.slice(0,this.pagesize);
        this.endingRecord = this.pagesize;
    }


    handleKeyChange(event) {
        this.accountSearch = event.target.value;
    }


    handlePrevious() {
        this.isPageChanged = true;
        if(this.page > 1) {
            this.page = this.page - 1;
            this.displayRecordPerPage(this.page);
        }
    }

    handleNext() {
        this.isPageChanged = true;
        if((this.page < this.totalPage) && this.page !== this.totalPage) {
            this.page = this.page + 1;
            this.displayRecordPerPage(this.page);
        }
    }

    displayRecordPerPage(page) {
        this.startingRecord = ((page - 1) * this.pagesize);
        this.endingRecord = (this.pagesize * this.page);
        this.endingRecord = (this.endingRecord > this.totalRecountCount) ? this.totalRecountCount : this.endingRecord;
        this.data = this.items.slice(this.startingRecord,this.endingRecord);
        this.startingRecord = this.startingRecord + 1;
    }
}