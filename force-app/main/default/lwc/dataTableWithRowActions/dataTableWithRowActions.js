import { LightningElement, track, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountRecordsWithDataTable.getAccountList';
import deleteAccId from '@salesforce/apex/AccountRecordsWithDataTable.deleteAccId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
const actions = [
                    { label: 'Show details', name: 'show_details' },
                    { label: 'Delete', name: 'delete' },
                ];

const  COLUMNS = [
                    { label: 'Account name',fieldName: 'Name',type: 'text'},
                    { label: 'Type',fieldName: 'Type',type: 'text'},
                    { label: 'Annual Revenue',fieldName: 'AnnualRevenue',type: 'Currency'},
                    { label: 'Phone',fieldName: 'Phone',type: 'phone'},
                    { label: 'Website',fieldName: 'Website',type: 'url'},
                    { label: 'Rating',fieldName: 'Rating',type: 'test'},
                    {
                        type: 'action',
                        typeAttributes: { rowActions: actions },
                    },
                 ];
export default class DataTableWithRowActions extends LightningElement {
    columns = COLUMNS;
    record = {};
    @track accountList = [];
    @track error;
    @track wiredAccountList = [];
    @wire(getAccountList) wiredAccounts(result) {
        this.wiredAccountList = result;
    
        if (result.data) {
          this.accountList = result.data;
          this.error = undefined;
        } else if (result.error) {
          this.error = result.error;
          this.accountList = [];
        }
      }


    handleRowAction(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        switch (actionName) {
            case 'delete':
                this.deleteRow(row);
                break;
            case 'show_details':
                this.showRowDetails(row);
                break;
            default:
        }
    }

    deleteRow(row) {
        //console.log('row is' + JSON.stringify(row));
        const { id } = row.Id;
        deleteAccId({ids:row.Id})
            .then((result)=>{
                if(result==true) {
                   // refreshApex (wiredAccounts);
                   refreshApex(this.wiredAccountList);
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title : 'Success',
                            message : 'User login Successfully',
                            variant : 'Success',
                        }),
                    );
                }
                else {
                    this.dispatchEvent(
                        new ShowToastEvent({
                            title : 'Error',
                            message : 'Invalid user...',
                            variant : 'Error'
                        }),
                    );
                }
             })
             .catch((error) => {
                this.error = error;
             }) 

        const index = this.findRowIndexById(id);
        if(index !== -1) {
            this.wiredAccounts = this.wiredAccounts
                .slice(0, index)
                .concat(this.wiredAccounts.slice(index + 1));
        }
    }


    findRowIndexById(id) {
        let ret = -1;
        this.wiredAccounts.deleteAccId((row, index) => {
            if(row.id === id) {
                ret = index;
                return true;
            }
            return false;
        });
        console.log('reutining'+ ret);
        return ret;
    }

    showRowDetails(row) {
        this.record = row;
    }
}