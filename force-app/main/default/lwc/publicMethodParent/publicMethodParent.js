import { LightningElement } from 'lwc';

export default class PublicMethodParent extends LightningElement {

    handleChange(event) {
        this.template.querySelector('c-public-method-child').changeMessage(event.target.value);
    }
}