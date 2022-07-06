import { LightningElement, track, wire } from 'lwc';
import getConList from '@salesforce/apex/ContactPaginationController.getConList';

export default class PaginationExample extends LightningElement {
    @track columns = [

        {label:'Contact Id', fieldName:'Id', type:'Id'},

        {label: 'LastName', fieldName: 'LastName', type: 'Text'},

        {label: 'FirstName', fieldName: 'FirstName', type: 'Text'},

        {label: 'Email', fieldName: 'Email', type: 'Email'},

        {label:'Phone', fieldName:'Phone', type: 'Phone'}

     ];

@track contactSearch = '';
@track error;
@track data=[];
@track page = 1;
@track pageSize = 5;
@track ispageChanged = true;
@track startingRecord = 1;
@track endingRecord = 0;
@track totalRecountCount = 0;
@track items = [];
@track totalPage = 0;

@wire(getConList,{conName: '$contactSearch'})
wiredContacts({ error, data }) {
    if (data) {
        console.log('data...'+data);
        this.processRecords(data);
        this.error = undefined;
    } else if (error) {
        this.error = error;
    }
}

processRecords(data) {
    this.items = data;
    this.totalRecountCount = data.length; 
    this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize);
    console.log('total page size:' + this.totalPage); 
    this.data = this.items.slice(0,this.pageSize); 
    this.endingRecord = this.pageSize;
    //this.columns = columns;
}


handleKeySearch(event) {
    this.contactSearch = event.target.value;
}

handlePrevious() {
   this.ispageChanged = true;
   if(this.page > 1) {
       this.page = this.page - 1;
       this.displayRecordPerPage(this.page);
   }
}

handleNext() {
    this.ispageChanged = true;
    if((this.page < this.totalPage) && this.page !== this.totalPage) {
        this.page = this.page + 1;
        this.displayRecordPerPage(this.page);
    }
}


displayRecordPerPage(page) {
    this.startingRecord = ((page -1) * this.pageSize);
    this.endingRecord = (this.pageSize * this.page);
    this.endingRecord = (this.endingRecord > this.totalRecountCount) ? this.totalRecountCount : this.endingRecord;
    this.data = this.items.slice(this.startingRecord,this.endingRecord);
    this.startingRecord = this.startingRecord + 1;
}
}