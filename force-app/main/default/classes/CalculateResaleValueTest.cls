@isTest
public with sharing class CalculateResaleValueTest {
	
    
    @isTest
    static void test1(){
         List<Bus__c> allBuses = new  List<Bus__c>();
         for (integer i=1;i<=10;i++){     
       		 Bus__c newbus =  new  Bus__c();
           //  newBus.Name = 'Bus ' + i;
        	 newbus.Air_conditioner__c = true;
        	 newbus.Odometer_Reading__c = 120000;
        	 newbus.Year__c = 2000;
        	 newbus.Maximum_Capacity__c='24';
        	 newbus.Current_Status__c = 'Ready For Use';
             allBuses.add(newbus); 
        }
        
        Test.startTest();
        Database.insert(allBuses, true);
        Test.stopTest();
        
     List<Bus__c> testBuses = [select id, Resale_Value__c from Bus__c where Current_Status__c = 'Ready For Use' and Resale_Value__c = 0 and  Maximum_Capacity__c='24' ];
     
        System.debug('testBuses size:='+ testBuses.size()); 
        system.assertEquals(0, testBuses.size(),'some issue');
        
        
    }
    
     @isTest
    static void test2(){
         List<Bus__c> allBuses = new  List<Bus__c>();
         for (integer i=1;i<=10;i++){     
       		 Bus__c newbus =  new  Bus__c();
           //  newBus.Name = 'Bus ' + i;
        	 newbus.Air_conditioner__c = true;
        	 newbus.Odometer_Reading__c = 160000;
        	 newbus.Year__c = 2000;
        	 newbus.Maximum_Capacity__c='36';
        	 newbus.Current_Status__c = 'Ready For Use';
             allBuses.add(newbus); 
        }
        
        Test.startTest();
        Database.insert(allBuses, true);
        Test.stopTest();
        
     List<Bus__c> testBuses = [select id, Resale_Value__c from Bus__c where Current_Status__c = 'Ready For Use' and Resale_Value__c = 0 and  Maximum_Capacity__c='36' ];
     
        System.debug('testBuses size:='+ testBuses.size()); 
        system.assertEquals(0, testBuses.size(), 'some issue');
        
        
    }
      @isTest
    static void test3(){
         List<Bus__c> allBuses = new  List<Bus__c>();
         for (integer i=1;i<=10;i++){     
       		 Bus__c newbus =  new  Bus__c();
          //   newBus.Name = 'Bus ' + i;
        	 newbus.Air_conditioner__c = true;
        	 newbus.Odometer_Reading__c = 160000;
        	 newbus.Year__c = 1972;
        	 newbus.Maximum_Capacity__c='36';
        	 newbus.Current_Status__c = 'Ready For Use';
             allBuses.add(newbus); 
        }
        
        Test.startTest();
        Database.insert(allBuses, true);
        Test.stopTest();
        
     List<Bus__c> testBuses = [select id, Resale_Value__c from Bus__c where Current_Status__c = 'Ready For Use' and Resale_Value__c = 0 and  Maximum_Capacity__c='36' ];
     
        System.debug('testBuses size:='+ testBuses.size()); 
        system.assertEquals(0, testBuses.size(), 'some issue');
        
        
    }
   
     @isTest
    static void test4(){
         List<Bus__c> allBuses = new  List<Bus__c>();
         for (integer i=1;i<=10;i++){     
       		 Bus__c newbus =  new  Bus__c();
           //  newBus.Name = 'Bus ' + i;
        	 newbus.Air_conditioner__c = true;
        	 newbus.Odometer_Reading__c = 160000;
        	 newbus.Year__c = 1972;
        	 newbus.Maximum_Capacity__c='24';
        	 newbus.Current_Status__c = 'Ready For Use';
             allBuses.add(newbus); 
        }
        
        Test.startTest();
        Database.insert(allBuses, true);
        Test.stopTest();
        
        List<Bus__c> testBuses = [select id, Resale_Value__c from Bus__c where Current_Status__c = 'Ready For Use' and Resale_Value__c = 0 and  Maximum_Capacity__c='36' ];
     
        System.debug('testBuses size:='+ testBuses.size()); 
        system.assertEquals(0, testBuses.size(), 'some issue');
        
        
    }
     
   
}