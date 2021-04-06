import { LightningElement, api} from 'lwc';
import { createMessageContext, releaseMessageContext,APPLICATION_SCOPE,subscribe, unsubscribe, publish } from 'lightning/messageService';
import SAMPLEMC from "@salesforce/messageChannel/SampleMessageChannel__c";
import ANOTHERMC from "@salesforce/messageChannel/AnotherMessageChannel__c";
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import {refreshApex} from '@salesforce/apex';


export default class LwcDetail extends LightningElement {

context = createMessageContext();
subscription = null;
receivedMessage = '';
@api accountId;
objectApiName='Account';
@api fields = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD];
////subscriber////
connectedCallback(){
          this.subscribeMC();
      }
      subscribeMC() {
          if (this.subscription) {
              return;
          }
          this.subscription = subscribe(this.context,SAMPLEMC,(message) => {
              this.handleMessage(message);
          },{scope:APPLICATION_SCOPE});
  
      }
      
      handleMessage(message){
          this.accountId = message.recordId;
          this.receivedMessage = message ? message.recordData.value : 'no message payload';
        }   

       
      
      ////subscriber////

/////////publisher/////
handleSubmit(event){
     // event.preventDefault();

        const message = {
            newrecordData:{value:"Message from Another LWC"}
        };
       refreshApex();

publish(this.context,ANOTHERMC,message);
}
/////////publisher/////

}