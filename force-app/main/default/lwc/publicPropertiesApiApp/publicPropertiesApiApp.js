import { LightningElement } from 'lwc';

export default class PublicPropertiesApiApp extends LightningElement {

    myItem = this.template.querySelector('c-public-properties-api').itemName;
}