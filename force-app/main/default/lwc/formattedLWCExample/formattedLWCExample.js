import { LightningElement } from 'lwc';

export default class FormattedLWCExample extends LightningElement {

    richtext = '<h2>Default</h2>';

    handlechange(event) {
        this.richtext = event.target.value;
    }
}