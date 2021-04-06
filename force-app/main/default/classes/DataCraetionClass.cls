public with sharing class DataCraetionClass {

    @invocableMethod
    public static void createData(){
        try{
           
        
    	Database.insert(TestDataFactory.createBus(10),true);
	    System.debug('Insert done');

        list<Bus__c> listBus = [select id, name from Bus__c with SECURITY_ENFORCED limit 1000];
		
        System.debug('listBus'+ listBus);
        }
            catch(Exception e){
                System.debug('in catch:='+ e.getStackTraceString()+e.getMessage());
            }
    }
    
}