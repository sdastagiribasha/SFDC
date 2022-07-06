import { LightningElement, track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountRecordsWithDataTable.getAccountList';
const COLUMNS  = [
                    { label: 'Account name',fieldName: 'Name',type: 'text'},
                    { label: 'Type',fieldName: 'Type',type: 'text'},
                    { label: 'Annual Revenue',fieldName: 'AnnualRevenue',type: 'Currency'},
                    { label: 'Phone',fieldName: 'Phone',type: 'phone'},
                    { label: 'Website',fieldName: 'Website',type: 'url'},
                    { label: 'Rating',fieldName: 'Rating',type: 'test'}
                ]
export default class DataTableWithRowNumbers extends LightningElement {
columns = COLUMNS;
@wire(getAccountList)
wiredAccounts;
}