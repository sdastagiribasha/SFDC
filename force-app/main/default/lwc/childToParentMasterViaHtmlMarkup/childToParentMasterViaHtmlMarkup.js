import { LightningElement, track } from 'lwc';

export default class ChildToParentMasterViaHtmlMarkup extends LightningElement {

    @track msg;
    handleCustomEvent(event) {
        const textVal = event.detail;
        this.msg = textVal;
    }
}