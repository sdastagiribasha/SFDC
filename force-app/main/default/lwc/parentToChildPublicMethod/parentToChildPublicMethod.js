import { LightningElement } from 'lwc';

export default class ParentToChildPublicMethod extends LightningElement {

    handlesubmit(event) {
       this.template.querySelector('c-parent-to-child-public-method-child-comp').changeName(event.target.value);
    }

    handlebuttonClick() {
        var userid = this.template.querySelector('.uname').value;
        var userpass = this.template.querySelector('.pword').value;
       /*
        var arruserdata = { options:
            [
                userid,
                userpass
            ]
        }
        */

        this.template.querySelector('c-parent-to-child-public-method-child-comp').handlebutton(userid);
    }
}