import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class UserLoginButton extends NavigationMixin(LightningElement) {

    /*
    clickLogin() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                url : 'https://login.salesforce.com/'
            }
        },
        true
        );
    }
    */
}