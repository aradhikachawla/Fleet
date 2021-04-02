public class TestDataFactory {

    public static List<Bus__c> createBus(integer count){
    
    List<Bus__c> allBuses = new  List<Bus__c>();
         for (integer i=1;i<=count;i++){     
       		 Bus__c newbus =  new  Bus__c();
           //  newBus.Name = 'Bus ' + i;
        	 newbus.Air_conditioner__c = true;
        	 newbus.Odometer_Reading__c = 160000;
        	 newbus.Year__c = 2000;
        	 newbus.Maximum_Capacity__c='60';
        	 newbus.Current_Status__c = 'Ready For Use';
             allBuses.add(newbus); 
        }
        
      System.debug(allBuses);
        return allBuses;
    }
}