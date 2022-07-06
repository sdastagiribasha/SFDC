import { LightningElement,api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class NavigationMixinExample extends NavigationMixin(LightningElement) {
    @api recordId;

    // Navigate to New Account Page
    navigateToNewAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
        });
    }
    
      //Navigate to view the Page
    navigateToViewAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0010o00002DUDFMAA5',
                objectApiName: 'Account',
                actionName: 'view'
            },
        });
    }

    //Navigate to Edit the Page
    navigateToEditAccountPage() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: '0010o00002DUDFMAA5',
                objectApiName: 'Account',
                actionName: 'Edit'
            },
        });
    }

    // Navigation to Opportunity List view(recent)
    navigateToOpportunityListView() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Opportunity',
                actionName: 'list'
            },
            state: {
                filterName: 'Recent'
            },
        });
    }

    // Navigation to Contact related list of account
    navigateToContactRelatedList() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordRelationshipPage',
            attributes: {
                recordId: '0010o00002DUDFMAA5',
                objectApiName: 'Account',
                relationshipApiName: 'Contacts',
                actionName: 'view'
            },
        });
    }

    // Navigation to web page 
    navigateToWebPage() {
        this[NavigationMixin.Navigate]({
            "type": "standard__webPage",
            "attributes": {
                "url": "https://www.google.com"
            }
        });
    }

    //Navigate to chatter
    navigateToChatter() {
        this[NavigationMixin.Navigate]({
            type: 'standard__namedPage',
            attributes: {
                pageName: 'chatter'
            },
        });
    }

    // Navigation to custom Tab
    navigateToTab() {
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                //Name of any CustomTab. Visualforce tabs, web tabs, Lightning Pages, and Lightning Component tabs
                apiName: 'Employees'
            },
        });
    }


    // Navigate to custom object Employee__c Page
    navigateToNewCustomObject(){
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Employee__c',
                actionName: 'new'
            },
        });
    }




}