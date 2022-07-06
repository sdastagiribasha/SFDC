import { LightningElement, track } from 'lwc';

export default class ParentToChild extends LightningElement {

    @track firstName;
    handleChange(event) {
        this.firstName = event.target.value;
    }

    @track userData;
    handleClick() {
        this.userData = this.template.querySelector('.uname').value;
        console.log('output' + this.userData);
    }

}