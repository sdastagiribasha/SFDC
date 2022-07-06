import { LightningElement, track } from 'lwc';
import parent from './lifeCycleExample.html';
import child from './childCmp.html';
import mobile from './mobileCmp.html';
import FORM_FACTOR from '@salesforce/client/formFactor';
export default class LifeCycleExample extends LightningElement {

    @track name;
    constructor() {
        super();
        console.log('********This is constructor Example**********');
    }
    
    connectedCallback() {
        this.name='Hello World Just open the Console Logs';
        console.log('*********This is ConnectedCallback Example************');
    }

    temp;
     render() {
        console.log('*********This is render Example***************');
        if(FORM_FACTOR == 'Large') {
            this.temp = parent;
        }
        if(FORM_FACTOR == 'Medium') {
            this.temp = child;
        }
        if(FORM_FACTOR == 'Small') {
            this.temp = mobile;
        }
        return this.temp;
     }

     renderedCallback() {
         console.log('*********This is renderedCallback Example****************');
     }

    disconnectedCallback() {
        console.log('*********This is disconnectedCallback Example*****************');
    }

    errorCallback() {
        console.log('*********This is errorCallback Example*****');
    }
}