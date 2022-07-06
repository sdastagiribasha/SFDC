import { LightningElement, track,api } from 'lwc';

export default class ParentToChildPublicProperty extends LightningElement {
    @track fname;
    handlechange(event) {
        this.fname = event.target.value;
    }

    @api message;
    handleClick() {
        this.message = this.template.querySelector('.Uname').value;
        console.log('print'+ this.message);
    }
}