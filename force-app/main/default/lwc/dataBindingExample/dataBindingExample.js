import { LightningElement } from 'lwc';

export default class DataBindingExample extends LightningElement {

    Greeting = 'World';
    Message = 'By using Value';
    name = '';
    //imess = '';

    //By using Value
    handleChange(event) {
        this.Message = event.target.value;
    }

    //By using Naming Property
    handleFirstName(event) {
        this.name = event.target.value;
    }

    //By using querySelector
    handleQuerySelector(event) {
        //this.imess = this.template.querySelector('c-lightning-input');
    }

    //By using Class
    handleClass(event) {
        
    }
}