import { LightningElement,api } from 'lwc';

export default class LwcToAuraExample extends LightningElement {

    @api
        lwcCompMethodDescription(messageFromAura){
        alert('messageFromAura :'+ messageFromAura);
        console.log('print '+messageFromAura);
    }
}