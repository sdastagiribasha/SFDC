import { LightningElement, track, wire } from 'lwc';
import Austro from '@salesforce/resourceUrl/Austro';
import fetchDolls from '@salesforce/apex/DollController.fetchDolls';
export default class DisplayDollWithCard extends LightningElement {

@track dollData;
@track error;
@track austroToy = Austro;

    @wire(fetchDolls)
    wiredDolls({data,error}) {
        if(data) {
            this.dollData = data;
            this.error = undefined;
        }
        else if(error) {
            this.error = error;
            this.data = undefined;
        }
    }
}