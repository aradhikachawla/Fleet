public with sharing class BatchClassForMaintanance  implements Database.Batchable<sObject>, Database.Stateful {
    
    
    public BatchClassForMaintanance(){
      System.debug('BatchClassForMaintanance');
    }

    
    public Database.QueryLocator start(Database.BatchableContext bc) 
    { 	
   		    System.debug('start');
            List<Bus__c> listBus =   [SELECT Id,   Name, Bus_ID__c, Odometer_Reading__c, Maximum_Capacity__c, Current_Status__c, Odometer_Records__c, (select Location__Latitude__s,Location__Longitude__s from sensors__r) FROM Bus__c where  Maximum_Capacity__c = '60' and Odometer_Records__c >=5000 and Current_Status__c ='Ready for Use' and  Schedule_for_service__c = true  with SECURITY_ENFORCED ];
            System.debug('listBus:'+ listBus);
            return Database.getQueryLocator('SELECT Id,   Name, Bus_ID__c, Odometer_Reading__c, Maximum_Capacity__c, Current_Status__c, Odometer_Records__c, Schedule_for_service__c, (select Location__Latitude__s,Location__Longitude__s from sensors__r) FROM Bus__c where Maximum_Capacity__c = \'60\' and Odometer_Records__c >=5000 and Current_Status__c =\'Ready for Use\' and Schedule_for_service__c = true  with SECURITY_ENFORCED');

    }
  
    
     public void execute(Database.BatchableContext info, List<Bus__c> listBus) {		
   		 system.debug('execute');
		 List<Maintenance_record__c> listMain = new List<Maintenance_record__c>();
         
         for (Bus__c s: listBus){	
             for (sensor__c sen: s.sensors__r){
             s.Current_Status__c = 'Scheduled for Maintenance' ;
             s.Latest_odometer_reading_when_serviced__c = s.Odometer_Records__c;
             s.loaction_of_the_bus__Latitude__s = sen.Location__Latitude__s;
             s.loaction_of_the_bus__Longitude__s = sen.Location__Longitude__s;
             System.debug(calculateGarage(sen)); 
             s.Garage__c = calculateGarage(sen).id;
             Maintenance_record__c mainR = new Maintenance_record__c();
             mainR.Bus__c = s.Id;
             mainR.Garage__c = calculateGarage(sen).id;
             listMain.add(mainR);
             
             }
         }       
         
         
         insert listMain;
         update  listBus;

   }
    
    
    
    
    
    

    public void finish(Database.BatchableContext info) { 
        system.debug('finish');

    }

    
    
    public static Garage__c calculateGarage(Sensor__c sen){
        Map<Garage__c, Double> mapGarage = new Map<Garage__c, Double>();
        List<Garage__c> listGarage = [select id, name,Location__Latitude__s, Location__Longitude__s from Garage__c ];      
        for (Garage__c g : listGarage){
        	Location loc1 = Location.newInstance(sen.Location__Latitude__s,sen.Location__Longitude__s);
			Location loc2 = Location.newInstance(g.Location__Latitude__s,g.Location__Longitude__s);
			Double dist = Location.getDistance(loc1, loc2, 'mi');          
            mapGarage.put(g,dist);
        }
        
        System.debug('mapGarage:'+mapGarage);
        
        List<Double> newD = mapGarage.values();
        newD.sort();
        Double t= newD.get(0);
        System.debug('t:'+t );
		Garage__c found = new Garage__c();
        for(Garage__c fg : mapGarage.keySet()){
            if (mapGarage.get(fg) == t ){
                 found  = fg;
            }
                
        }
        
        System.debug('found:'+found  );
        System.debug('t:'+t  );
return found;
    }
    
}