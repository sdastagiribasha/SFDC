import { LightningElement } from 'lwc';

export default class ShowChildCmp extends LightningElement {

    /*
        parent and child comonents are there, first Parent component displayed in UI and inserted into the DOM after that child component displayed in UI 
		  and inserted into the DOM. now if you are trying to remove the child component in to the DOM that time only Disconnected callback will run/execute.
    */
    disconnectedCallback() {
        console.log('*********Inside child component Disconnected callback calling *********');
    }
}