import {LightningElement, api } from 'lwc';

export default class ApiPublicProperties extends LightningElement {

    @api itemName = 'Non-Veg';
    @api seconditem = 'fooditem';
}