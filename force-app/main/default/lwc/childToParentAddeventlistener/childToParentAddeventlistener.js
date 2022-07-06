import { LightningElement } from 'lwc';

export default class ChildToParentAddeventlistener extends LightningElement {

    handleChange(event) {
        const name = event.target.value;
        const selectEvent = new CustomEvent('mycustomEvent',{detail : name, bubbles: true});
        this.dispatchEvent(selectEvent);
    }
}