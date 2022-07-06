import { LightningElement,api, track } from 'lwc';

export default class ParentToChildComponent extends LightningElement {

    @api displayMessage;
    @api informationDisplay;
}