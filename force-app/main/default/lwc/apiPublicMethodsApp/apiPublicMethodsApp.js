import { LightningElement } from 'lwc';

export default class ApiPublicMethodsApp extends LightningElement {

    handleRefresh() {
        this.template.querySelector('c-api-public-methods').refresh();
    }
}