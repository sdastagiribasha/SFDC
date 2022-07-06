import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
export default class Loginpage extends NavigationMixin(LightningElement) {
    handlebuttonsignup () {
        this[NavigationMixin.Navigate]({
            type: 'comm__namedPage',
            attributes: {
                name: 'signuppage__c'
            }
        });
    }
}