import { api, LightningElement, track, wire } from 'lwc';
import fetchContactList from '@salesforce/apex/ContactPaginationController.fetchContactList';
import {refreshApex} from '@salesforce/apex';

    const columns = [

                        {label:'Contact Id', fieldName:'Id', type:'Id',sortable:true},

                        {label: 'LastName', fieldName: 'LastName', type: 'Text', sortable:true},

                        {label: 'FirstName', fieldName: 'FirstName', type: 'Text',sortable:true},

                        {label: 'Email', fieldName: 'Email', type: 'Email',sortable:true},

                        {label:'Phone', fieldName:'Phone', type: 'Phone',sortable:true}

                    ];
export default class ContactPaginationExample extends LightningElement {
 
    

    @api searchKey = '';
    @api sortedDirection = 'asc';
    @api sortedBy = 'Name';

    //@track responseData;
    @track data = [];
    @track error; 
    @track data;
    @track columns;
    @track value;
    @track totalRecountCount = 0;
    @track totalPage = 0; 
    @track allSelectedRows = [];
    @track page = 1;  
    @track pageSize = 5;
    @track startingRecord = 1;
    @track endingRecord = 0;
    @track items = [];
    isPageChanged = false;
    result;
    initialLoad = true;
    mapConNameVsCon = new Map();;

    //wired function method start here
    @wire(fetchContactList,{searchKey : '$searchKey' ,sortBy : '$sortBy' ,sortDirection : '$sortDirection'})
    wiredContacts({ error, data }) {
        if (data) {
            console.log('data...'+ JSON.stringify(data));
            this.processRecords(data);
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.responseData = undefined;
        }
    }

    //for count the pagesize
    processRecords(data) {
        this.items = data;
        this.totalRecountCount = data.length;
        this.totalPage = Math.ceil(this.totalRecountCount / this.pageSize);
        this.data = this.items.slice(0,this.pageSize);
        this.endingRecord = this.pageSize;
        this.columns = columns;
    }

    //clicking on previous button
    previousHandler() {
        this.isPageChanged = true;
        if(this.page > 1) {
            this.page = this.page - 1;
            this.displayRecordPerPage(this.page);
        }
        var selectedIds = [];
        for(var i=0;i<this.allSelectedRows.length;i++) {
            selectedIds.push(this.allSelectedRows[i].id);
        }
        this.template.querySelector('[data-id="table"]').selectedRows = selectedIds;
    }

    //clicking on next button
    nextHandler() {
        this.isPageChanged = true;
        if((this.page<this.totalPage) && this.page!== this.totalPage) {
            this.page = this.page + 1;
            this.displayRecordPerPage(this.page);
        }
        var selectedIds = [];
        for(var i=0; i<this.allSelectedRows.length;i++) {
            selectedIds.push(this.allSelectedRows[i].id);
        }
        this.template.querySelector('[data-id="table"]').selectedRows = selectedIds;
    }

    //To display records per page
    displayRecordPerPage(page){
        this.startingRecord = ((page -1) * this.pageSize);
        this.endingRecord = (this.pageSize * page);
        this.endingRecord = (this.endingRecord > this.totalRecountCount) ? this.totalRecountCount : this.endingRecord;
        this.data = this.items.slice(this.startingRecord,this.endingRecord);
        this.startingRecord = this.startingRecord + 1;
    }

    //sorting columns
    sortColumns(event) {
        this.sortedBy = event.detail.fieldName;
        this.sortedDirection = event.detail.sortDirection;
        return refreshApex(this.result);
    }

    //RowSelection
    onRowSelection(event) {
        if(!this.isPageChanged || this.initialLoad) {
            if(this.initialLoad) this.initialLoad = false;
            this.processSelectedRows(event.detail.selectedRows);
        } else {
                this.isPageChanged = false;
                this.initialLoad = true;
        }
    }

    //Process for selectedRows
    processSelectedRows(selectedContacts) {
        var newMap = new Map();
        for(var i=0;i<selectedContacts.length;i++) {
            if(!this.allSelectedRows.includes(selectedContacts[i])) {
                this.allSelectedRows.push(selectedContacts[i]);
            }
            this.mapConNameVsCon.set(selectedContacts[i].Name,selectedContacts[i]);
            newMap.set(selectedContacts[i].Name,selectedContacts[i]);
        }
        for(let [key,value] of this.mapConNameVsCon.entries()) {
            if(newMap.size<=0 || (!newMap.has(key) && this.initialLoad)) {
                const index = this.allSelectedRows.indexOf(value);
                if(index > -1) {
                    this.allSelectedRows.splice(index, 1);
                }
            }
        }
    }

    
    //Reading input value
    handleKeyChange(event) {
        this.searchKey = event.target.value;
        var data = [];
        for(var i=0; i<this.items.length; i++) {
            if(this.items[i]!= undefined && this.items[i].Name.includes(this.searchKey)) {
                data.push(this.items[i]);
            }
            this.processRecords(data);
        }
    }
    
}