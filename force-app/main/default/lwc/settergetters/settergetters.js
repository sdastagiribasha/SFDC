import { LightningElement,api } from 'lwc';

export default class Settergetters extends LightningElement {
    @api ufname;
    @api ulname;
    handleclickwithgetter(event) {
        if(event.target.name == 'fname1') {
            this.ufname = event.target.value;
            console.log('User first Name is :' + this.ufname);
        }
        if(event.target.name == 'lname1') {
            this.ulname = event.target.value;
            console.log('User LastName is:'+ this.ulname);
        }
    }
     get userinformation() {
         if(this.ufname) {
            return this.ufname;
         }
         if(this.ulname) {
             return this.ulname;
         }
         
     }



    /*
    @track setname='cloudodyssey';
   get name() {
       return 'hello';
   }
   set namechange(value) {
       this.setname = value;
   }

   handleclick() {
       this.namechange ='Setting data from setter method';
   }
   */
}