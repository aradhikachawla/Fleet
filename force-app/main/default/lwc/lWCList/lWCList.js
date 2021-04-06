import { LightningElement, wire } from 'lwc';
import getBuses from '@salesforce/apex/LWCController.getBuses';

export default class LWCList extends LightningElement {

          @wire(getBuses)
          buses;
          

          
          
}