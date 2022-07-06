import { LightningElement, track, wire } from 'lwc';
import fetchEmpData from '@salesforce/apex/EmployeeDataController.fetchEmpData';
export default class ChildToParentWithEmployeeData extends LightningElement {

    @track data;
    @track error;

    @wire(fetchEmpData)
    wiredEmployeeData (error,data) {
        if(data) {
            this.data = data;
            this.error = undefined;
        }
        else if(error) {
            this.error = error;
            this.data = undefined;
        }
    }
}