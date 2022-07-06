import { LightningElement } from 'lwc';

export default class ScenarioWithLightningTab extends LightningElement {

    activeTab = '1';

   get disableBackbutton() {
        return Number(this.activeTab) == 1 ? true : false;
    }
    get disableContinue() {
        return Number(this.activeTab) == 4 ? true : false;
    }


    handleActiveTab(event) {
       this.activeTab = event.target.value;
    }
    handleBackbutton() {
        let activeTabValue = Number(this.activeTab) - 1;
        this.activeTab = activeTabValue.toString();
       
    }
    handleContinuebutton() {
    console.log('*******'+this.activeTab);
       let activeTabValue = Number(this.activeTab) + 1;
       this.activeTab = activeTabValue.toString();
       console.log('*******'+this.activeTab);
    }

}