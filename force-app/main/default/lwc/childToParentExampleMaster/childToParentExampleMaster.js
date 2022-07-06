import { LightningElement, track } from 'lwc';

export default class ChildToParentExampleMaster extends LightningElement {

    @track progressPP = 0;
    handleProgressBarValueChange(event) {
        this.progressPP = event.detail;
    }
}