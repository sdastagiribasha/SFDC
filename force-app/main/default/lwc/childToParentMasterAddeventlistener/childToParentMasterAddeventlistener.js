import { LightningElement,track } from 'lwc';

export default class ChildToParentMasterAddeventlistener extends LightningElement {
    @track msg;

    constructor() {
        super();
        this.template.addEventListener('mycustomEvent',this.handleCustomEvent.bind(this));
    }

    handleCustomEvent(event) {
        const textVal = event.detail;
        this.msg = textVal;
    }
}