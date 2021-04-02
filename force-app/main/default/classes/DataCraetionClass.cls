public class DataCraetionClass {

    public static void CreateData(){
    	Database.insert(TestDataFactory.createBus(10),true);
		list<Bus__c> listBus = [select id, name from Bus__c];
		System.debug(listBus);
    }
    
}