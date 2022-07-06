import { LightningElement, track, wire } from 'lwc';
import Employee_Obj from '@salesforce/schema/Employee__c';
import Name_field from '@salesforce/schema/Employee__c.Name';
import LastName_field from '@salesforce/schema/Employee__c.LastName__c';
import Email_field from '@salesforce/schema/Employee__c.Email__c';
import Phone_field from '@salesforce/schema/Employee__c.Phone__c';
import UserName_field from '@salesforce/schema/Employee__c.UserName__c';
import Password_field from '@salesforce/schema/Employee__c.Password__c';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import fetchEmp from '@salesforce/apex/EmployeObjController.fetchEmp';

export default class SignUpPage extends NavigationMixin(LightningElement) {

    empObj =  Employee_Obj;

    @track empobjName = Name_field;
    @track empobjLastName = LastName_field;
    @track empobjEmail = Email_field;
    @track empobjPhone = Phone_field;
    @track empobjUserName = UserName_field;
    @track empobjPassword = Password_field;

    empObj = {
            Name : this.empobjName,
            LastName__c : this.empobjLastName,
            Phone__c : this.empobjPhone,
            Email__c : this.empobjEmail,
            UserName__c : this.empobjUserName,
            Password__c : this.empobjPassword
    }

    empFirstNameChange (event) {
        this.empObj.Name = event.target.value;
    }
    empLastNameChange (event) {
        this.empObj.LastName__c = event.target.value;
    }
    empEmailChange (event) {
        this.empObj.Email__c = event.target.value;
    }
    empPhoneChange (event) {
        this.empObj.Phone__c = event.target.value;
    }
    empUserNameChange (event) {
        this.empObj.UserName__c = event.target.value;
    }
    empPasswordChange (event) {
        this.empObj.Password__c = event.target.value;
    }

    //While Clicking Submit Button
    submitAction() {
        if(!this.Name_field=='') {
            this.dispatchEvent ( new ShowToastEvent({
                title : 'Error',
                message : 'FirstName is Empty',
                Variant : 'error',
            }),
        );
        //return false; 
        }

        fetchEmp ({emp : this.empObj})
        .then(result => {
            this.message = result;
            this.error = undefined;
            if(this.message != undefined) {
                this.empObj.Name='';
                this.empObj.LastName__c= '';
                this.empObj.Email__c='';
                this.empObj.Phone__c='';
                this.empObj.UserName__c='';
                this.empObj.Password__c='';
                    this.dispatchEvent( new ShowToastEvent({
                        title : 'Success',
                        message : 'Record Insertion Successfully',
                        Variant: 'success',
                    }),
                    );
                    this[NavigationMixin.navigate] ({
                        "type": "standard__webPage",
                        "attributes": {
                            "url": 'https://shaik-developer-edition.ap8.force.com/customercommunity/s/loginpage'
                        }
                    });
             }
             console.log(JSON.stringify(result));
             console.log("result",this.message);
        })
        .catch(error => {
            this.message = undefined;
            this.error = error;
            this.dispatchEvent ( new ShowToastEvent({
                title : 'Error, Record Creation Failed',
                message : error.body.message,
                variant : 'error',
            }),
            );
            console.log("error", JSON.stringify(this.error));
        });
        
    }
    /*
    //while clicking the Link- Login
    backtoLoginpage() {
        this[NavigationMixin.navigate] ({
            type: 'comm__namedPage',
            attributes: {
                name: 'loginpage__c'
            }
        });
        
    }
    */

}