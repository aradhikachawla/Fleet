public with sharing class DataCraetionClass {

    public static void createData(){

    	Database.insert(TestDataFactory.createBus(10),true);
	list<Bus__c> listBus = [select id, name from Bus__c with SECURITY_ENFORCED limit 1000];
	System.debug(listBus);
    }
    
}