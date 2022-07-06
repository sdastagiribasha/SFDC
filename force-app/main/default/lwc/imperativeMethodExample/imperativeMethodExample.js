import { LightningElement, track } from 'lwc';
import  accountList from '@salesforce/apex/WiretoFunctionController.accountList';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ImperativeMethodExample extends LightningElement {

    @track uname;
    @track pword;
    
    handleClick() {
        this.uname = this.template.querySelector('.username').value;
        this.pword = this.template.querySelector('.password').value;
        
        if(!this.uname) {
            this.dispatchEvent (
                new ShowToastEvent({
                    title : 'error',
                    message : 'Please enter the userName',
                    variant : 'error',
                }),
            );
            return false;
        }
        if(!this.pword)  {
            this.dispatchEvent (
                new ShowToastEvent({
                    title : 'error',
                    message: 'please enter the Password',
                    variant: 'error',
                }),
            );
            return false;
        }

        accountList({username:this.uname,password:this.pword})
         .then((result)=>{
            if(result==true) {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title : 'Success',
                        message : 'User login Successfully',
                        variant : 'Success',
                    }),
                );
            }
            else {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title : 'Error',
                        message : 'Invalid user...',
                        variant : 'Error'
                    }),
                );
            }
         })
         .catch((error) => {
            this.error = error;
         })
    } 
}