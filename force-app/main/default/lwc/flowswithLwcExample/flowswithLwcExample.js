import { LightningElement,api } from 'lwc';

export default class FlowswithLwcExample extends LightningElement {
    @api strRecordId;
    arrayFields = ['Name', 'AccountNumber', 'Phone', 'Type', 'Website'];
}