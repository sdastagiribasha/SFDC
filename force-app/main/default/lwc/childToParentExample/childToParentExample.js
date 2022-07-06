import { LightningElement,api} from 'lwc';

export default class ChildToParentExample extends LightningElement {

//@api progressValue;

    handleChange(event) {
        
        const progressValue = event.target.value;
        const custEvent = new CustomEvent("progressbarvaluechange",{
            detail : progressPP
        });

        this.dispatchEvent(custEvent);
    }
}