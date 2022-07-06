import { LightningElement,track } from 'lwc';
import myfirstlabel from '@salesforce/label/c.myfirstcustomlabel';
import currentuserid from '@salesforce/user/Id';
import checkviewsetup from '@salesforce/userPermission/ViewSetup';
export default class ExampleProgram extends LightningElement {

    userid = currentuserid;
    labels = {
        myfirstlabel
    }
   /*
    get isSetupEnabled() {
        return checkviewsetup;
    }
    openSetup(e) {

    }
    */
    /*
    @track clickedButtonLabel = 'Show';  
    @track boolVisible = false;  
  
    handleClick(event) {  
        const label = event.target.label;  
  
        if ( label === 'Show' ) {  
  
            this.clickedButtonLabel = 'Hide';  
            this.boolVisible = true;  
  
        } else if  ( label === 'Hide' ) {  
              
            this.clickedButtonLabel = 'Show';  
            this.boolVisible = false;  
  
        }  
    }
    */  
}