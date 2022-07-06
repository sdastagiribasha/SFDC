import { LightningElement } from 'lwc';

export default class LwcInputTagExample extends LightningElement {

    clickbutton;
    handleClick(event) {
        this.clickbutton = event.target.label;
    }
}