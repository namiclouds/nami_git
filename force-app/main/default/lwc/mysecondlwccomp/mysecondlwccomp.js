import { LightningElement, track, api, wire } from 'lwc';
//import myapexMethod from '@salesforce/apex/MapexclassName.myPaexMehtodName'

export default class Mysecondlwccomp extends LightningElement {
@track greeting='Welcome to LWC';
@track greeting1='Welcome to lightning';
@api privatagreeting='';
//@wire(myapexMethod) contacts;


}