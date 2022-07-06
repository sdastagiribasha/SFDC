import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ToastEventExample extends LightningElement {

    successToastFunction() {

        const evt = new ShowToastEvent({

            title: 'Success Message',

            message: 'Record inserted successfully ',

            variant: 'success',

            mode:'dismissible'

        });

        this.dispatchEvent(evt);

    }

    errorToastFunction() {

        const evt1 = new ShowToastEvent({

            title: 'Error Message',

            message: 'Record inserted failed ',

            variant: 'error',

            mode:'pester'

        });

        this.dispatchEvent(evt1);

    }

    warningToastFunction() {

        const evt2 = new ShowToastEvent({

            title: 'Warning Message',

            message: 'Some problem occured ',

            variant: 'warning',

            mode:'sticky'

        });

        this.dispatchEvent(evt2);

    }

 

    informationToastFunction() {

        const evt3 = new ShowToastEvent({

            title: 'Information Message',

            message: 'Operation running in background ',

            variant: 'info',

            mode:'dismissible'

        });

        this.dispatchEvent(evt3);

    }
}