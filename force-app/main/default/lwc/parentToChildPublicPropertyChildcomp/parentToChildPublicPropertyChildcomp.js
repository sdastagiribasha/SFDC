import { LightningElement,api } from 'lwc';

export default class ParentToChildPublicPropertyChildcomp extends LightningElement {

    @api messagedisplay;

    @api infoDisplay;

    connectedCallback() {
        console.log('Print infodispay'+this.infoDisplay);
    }
    
    

}