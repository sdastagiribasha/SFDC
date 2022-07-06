import { LightningElement,api, track } from 'lwc';

export default class ParentToChildPublicMethodChildComp extends LightningElement {

    @track name;
    @api changeName(stringName) {
        this.name = stringName;
        console.log('ResponseData>>>>>>>>>>>'+this.name)
    }

    @track user;
    @api handlebutton (textofuser) {
        this.user = textofuser;
        console.log('with button' + this.user);
    }
}