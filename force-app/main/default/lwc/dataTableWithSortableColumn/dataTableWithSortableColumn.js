import { LightningElement, track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountRecordsWithDataTable.getAccountList';

const COLUMNS = [
                    { label: 'Account name',fieldName: 'Name',type: 'text',sortable: "true"},
                    { label: 'Type',fieldName: 'Type',type: 'text',sortable: "true"},
                    { label: 'Annual Revenue',fieldName: 'AnnualRevenue',type: 'Currency',sortable: "true"},
                    { label: 'Phone',fieldName: 'Phone',type: 'phone',sortable: "true"},
                    { label: 'Website',fieldName: 'Website',type: 'url',sortable: "true"},
                    { label: 'Rating',fieldName: 'Rating',type: 'test',sortable: "true"},
                ];
export default class DataTableWithSortableColumn extends LightningElement {
columns = COLUMNS;
@track responseData;
@track error;
@track sortBy;
@track sortDirection;

@wire(getAccountList)
wiredAccounts(result) {
    if(result.data) {
        this.responseData = result.data;
        this.error = undefined;
    }
    else {
        this.error = result.error;
        this.responseData = undefined;
    }
}

onHandleSort(event) {
    this.sortBy = event.detail.fieldName;
    this.sortDirection = event.detail.sortDirection;
    this.sortData(this.sortBy,this.sortDirection);
                
}

sortData(fieldname,direction) {
    let parseData = JSON.parse(JSON.stringify(this.responseData));
    let KeyValue = (a) => {
        return a[fieldname];
    };
    let isReverse = direction === 'asc' ? 1:-1;
    parseData.sort((x,y) => {
        x = KeyValue(x) ? KeyValue(x) :'';
        y = KeyValue(y) ? KeyValue(y) :'';
        return isReverse * ((x>y) - (y>x));
    });
    this.responseData = parseData;
}


}