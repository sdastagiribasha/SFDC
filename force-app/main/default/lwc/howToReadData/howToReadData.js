import { LightningElement, track } from 'lwc';

export default class HowToReadData extends LightningElement {

     fname;
     lname;
    handlechange(event) {
        this.fname = event.target.value;
    }

    handleChangelastname(eve) {
        this.lname = eve.target.value;
    }

    uname;
    pword;
    handleclick() {
       var inputEle= this.template.querySelectorAll('lightning-input');
       inputEle.forEach(element => {
            if(element.name == 'UserName') {
                this.uname = element.value;
            }
            if(element.name == 'Password') {
                this.pword = element.value;
            }
        });
        
    }
    useremail;
    userkey;
    userPassword;
    handlebuttonclick() {
        this.useremail = this.template.querySelector('.email').value;
        this.userkey = this.template.querySelector('.secreatkey').value;
        this.userPassword = this.template.querySelector('.Passwordenter').value;
    }
}