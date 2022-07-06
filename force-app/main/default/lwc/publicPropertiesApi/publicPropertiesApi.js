import { LightningElement,api } from 'lwc';

export default class PublicPropertiesApi extends LightningElement {

    @api itemName = 'New Item';
}