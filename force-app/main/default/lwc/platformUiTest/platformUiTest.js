import { LightningElement, track, wire } from 'lwc';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
export default class PlatformUiTest extends LightningElement {

    value = '';
    @track PicklistValues;
    @track error;
    
    @wire(getObjectInfo,{ objectApiName: ACCOUNT_OBJECT})
    accountMetadata;
    
    //now get the industry picklist values
    @wire(getPicklistValues,
        {
            recordTypeId: '$accountMetadata.data.defaultRecordTypeId',
           // recordTypeId: '0010o00002DUDFMAA5',
            fieldApiName:  INDUSTRY_FIELD
        })
        industryPicklist({ data,error}) {
            if(data) {
                console.log('Picklist values are ${data}');
            }
            if(error) {
                console.log('Error coming ${error}');
            }
        }
    // on select picklist value to show the selected value
    handleChange(event) {
        this.value = event.detail.value;
    }
}