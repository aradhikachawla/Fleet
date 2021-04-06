public with sharing class LWCController {

    public LWCController() {
    System.debug('LWCController');
    }

    @AuraEnabled(cacheable=true)
    public static List<Bus__c> getBuses(){

        List<Bus__c> listBus = [select Id,  Name,Resale_Value__c,Year__c,Bus_Image__c  from Bus__c with SECURITY_ENFORCED];
        System.debug('listBus:='+ listBus);

    return listBus;
    }



}