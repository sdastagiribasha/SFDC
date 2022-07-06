import { LightningElement } from 'lwc';

export default class SettergetterExample extends LightningElement {

    fname;
    lname;
    email;
    handlechangewithgetter(event) {
        if(event.target.name =='firstname') 
            this.fname = event.target.value; 
    }
    get userfirstname() {
        return this.fname;
    }

    get userlastname() {
        return 'Ashraf';
    }
}