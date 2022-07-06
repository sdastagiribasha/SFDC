import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
export default class NavigationExample extends NavigationMixin(LightningElement) {
  
     //Navigate to view the Contact Record Page
    viewContactRecordPage () {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0030o00002cZq8jAAC',
                objectApiName: 'Contact',
                actionName: 'view'
            },
        });
    }

    //Navigate to edit the Contact Record Page
    editContactRecordPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0030o00002cZq8WAAS',
                objectApiName: 'Contact', 
                actionName: 'edit'
            },
        });
    }

    //Navigate to Custom Tab for Lightning Component
    navToLightningComponentTab() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'LWC_Tab'
            },
        });
    }


     //Navigate to Custom Tab for webtab
     navigateToCustomWebTab() {
        this[NavigationMixin.Navigate]({
            type: 'standard__webPage',
            attributes: {
                apiName: 'customwebtab'
            }
        });
    }

    //Navigate to Custom Tab for VFTab
    navToCustomVFTab() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'customVFtab'
            },
        });
    }

    // Navigate to Custom Tab for Lightning Page
    navToLightningPageTab() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                apiName: 'Apex'
            },
        });
    }

    //Navigate to contact Recordpage with default values
    navToContactWithDefaultValues() {
        const defaultValues = encodeDefaultFieldValues({
            FirstName: 'Arshad',
            LastName: 'Shaik',
            LeadSource: 'Web'
        });
        console.log(defaultValues);

        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            state: {
                defaultFieldValues: defaultValues
            }
        });
    }
}