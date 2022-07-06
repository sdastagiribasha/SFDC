import { LightningElement, track } from 'lwc';

export default class DisconnectedCallbackExample extends LightningElement {
    
    @track showchildcmp=false;

    handleclick() {
        this.showchildcmp = !this.showchildcmp;
        console.log('Inside  parent component');
    }

   // @track name;
    constructor() {
        super();
        console.log('********This is constructor Example**********');
    }
    
    connectedCallback() {
        //this.name='Hello World';
        console.log('*********This is ConnectedCallback Example************');
    }

    //temp;
     //render() {
        //console.log('*********This is render Example***************');
        // if(FORM_FACTOR == 'Large') {
        //     this.temp = parent;
        // }
        // if(FORM_FACTOR == 'Medium') {
        //     this.temp = child;
        // }
        // if(FORM_FACTOR == 'Small') {
        //     this.temp = mobile;
        // }
        // return this.temp;
     //}

     renderedCallback() {
         console.log('*********This is renderedCallback Example****************');
     }

    disconnectedCallback() {
        console.log('*********This is disconnectedCallback Example*****************');
    }

    errorCallback() {
        console.log('*********This is errorCallback Example*****');
    }

}