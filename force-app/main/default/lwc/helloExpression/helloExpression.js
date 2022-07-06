import { LightningElement, track } from 'lwc';

export default class TrackExample extends LightningElement {
    
    /****************************WITH OUT USING @TRACK *******************************************/
    firstName = '';
    lastName = '';

    handleChange(event) {
        const field = event.target.name;
        if (field === 'firstName') {
            this.firstName = event.target.value;
        } else if (field === 'lastName') {
            this.lastName = event.target.value;
        }
    }

    get uppercasedFullName() {
        return `${this.firstName} ${this.lastName}`.trim().toUpperCase();
    }
    
/***********************************WITH USING TRACK ***********************************************/
   /*
@track fullname = {firstname:'', lastname:''}
    handleChange(event) {
        this.fullname.firstname='jhon';
        this.fullname = event.target.value;
    }

    */
}