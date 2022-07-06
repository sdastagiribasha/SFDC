import { LightningElement , track} from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import SalesforceLogo from '@salesforce/resourceUrl/SalesforceLogo';
import backgroundimage from '@salesforce/resourceUrl/Mylogo';
export default class SfdcLoginPage extends NavigationMixin(LightningElement) {
    SalesforceLogourl = SalesforceLogo;
    //backgroundimageurl = backgroundimage;
   
    // one component to another component/Pagereference we can achive two ways either Navigation Mixion / conditonal Rendering.
    /************************************** With Navigation Mixion ***********************************************************/
    /*
    clicksignup() {
        this[NavigationMixin.Navigate]({
            type: 'comm__namedPage',
            attributes: {
                name: 'employeDetails__c'
            }
        });
     }
     */

    /************************************ With Conditonal Rendering************************************************************/
    @track areDetailsVisible = false;
    actionButtonLabel= 'SignUp';
    clicksignup() {
        this.areDetailsVisible = !this.areDetailsVisible;
        console.log(this.areDetailsVisible);
    }
    
}