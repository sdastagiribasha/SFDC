import { LightningElement } from 'lwc';

export default class FirstLWC extends LightningElement {

    handleclick(event) {
        alert('Hellooo...!'); //When ever i click the lightning card section it will alert
    }
}