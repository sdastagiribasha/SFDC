import { LightningElement,track } from 'lwc';

export default class ChildToParentMaster extends LightningElement {

    @track progressValue = 0;
    handleProgressValueChange(event) {
        this.progressValue = event.detail;
    }
}