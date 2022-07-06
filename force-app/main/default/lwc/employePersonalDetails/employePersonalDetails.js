import { LightningElement } from 'lwc';

export default class EmployePersonalDetails extends LightningElement {

    value9= '';
    get options9() {
        return [
            {label: 'Mr.', value9: 'option1'},
            {label: 'Ms.', value9: 'option2'},
            {label: 'Mrs.', value9: 'option3'},
            {label: 'Dr.', value9: 'option4'},
            {label: 'Prof.', value9: 'option5'},
        ];
    }
    handlechangesalutation(event) {
        this.value9 = event.target.value;
    }

    value= '';
    get options() {
        return [
            {label: 'Male', value: 'option1'},
            {label: 'Female', value: 'option2'},
        ];
    }

    value1= '';
    get options1() {
        return [
            {label: 'Full Time', value1: 'option1'},
            {label: 'Part Time', value1: 'option2'},

        ];
    }
    handlechange(event) {
        this.value1 = event.detail.value;
    }
}