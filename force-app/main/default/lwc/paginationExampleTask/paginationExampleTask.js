import { LightningElement,track } from 'lwc';
import getAccounts from '@salesforce/apex/paginationExampleTaskController.getAccounts';

import getAccountsCount from '@salesforce/apex/paginationExampleTaskController.getAccountsCount';

const columns = [

    { label: 'Name', fieldName: 'Name' },

    { label: 'Rating', fieldName: 'Rating' },

    { label: 'Industry', fieldName: 'Industry' }

];
export default class PaginationExampleTask extends LightningElement {

       
        @track contacts = [];
        @track columns = columns; 
        @track paginationRange = [];
        @track totalRecords;
        
        constructor() {

            super();
    
            getAccountsCount()
            .then(count => {
    
                if (count) {
                    //get the total count of records
    
                    this.totalRecords = count;
    
                    getAccounts()
                    .then(data => {
    
                        let i = 1;

                        this.contacts = data;
    
                        //looking at displaying 3 recrods per page
    
                        const paginationNumbers = Math.ceil(this.totalRecords / 20);
    
                        //create an array with size equals to paginationNumbers
    
                        while (
    
                            this.paginationRange.push(i++) < paginationNumbers
    
                            // eslint-disable-next-line no-empty
    
                        ) {}
    
                    });
    
                }
    
            });
    
        }

        handlePaginationClick(event) {

            let offsetNumber = event.target.dataset.targetNumber;

            //reduce 1 from the clciked number and multiply it with 3,
    
            //since we are showing 3 records per page and pass the offset to apex class
    
            getAccounts({ offsetRange: 20 * (offsetNumber - 1) })
    
                .then(data => {
    
                    this.contacts = data;
    
                })
    
                .catch(error => {
    
                    // eslint-disable-next-line no-console
    
                    console.log(error);
    
                });
    
        }
    
    
}