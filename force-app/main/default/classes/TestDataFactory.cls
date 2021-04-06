public class TestDataFactory {

    public static List<Bus__c> createBus(integer count){
    
    List<Bus__c> allBuses = new  List<Bus__c>();
            List<sensor__c> allsensors = new  List<sensor__c>();

         for (integer i=1;i<=count;i++){     
       		 Bus__c newbus =  new  Bus__c();
        	 newbus.Air_conditioner__c = true;
        	// newbus.Odometer_Records__c = 160000;
        	 newbus.Year__c = 2000;
        	 newbus.Maximum_Capacity__c='60';
        	 newbus.Current_Status__c = 'Ready For Use';
             newbus.Bus_Image__c='https://media.istockphoto.com/photos/white-tour-bus-picture-id974313674?k=6&m=974313674&s=612x612&w=0&h=YHb67YOSOvp7-npMNsWXELg3d83TzaYS1TgLraQGi0o=';
             allBuses.add(newbus); 
             
             
      }
        
        
        
        List<Bus__c> allBuses1 = new  List<Bus__c>();
         for (integer i=1;i<=count;i++){     
       		 Bus__c newbus =  new  Bus__c();
        	 newbus.Air_conditioner__c = true;
        	// newbus.Odometer_Records__c = 120000;
        	 newbus.Year__c = 2000;
        	 newbus.Maximum_Capacity__c='24';
        	 newbus.Current_Status__c = 'Ready For Use';
             newbus.Bus_Image__c='https://media.gettyimages.com/photos/bus-picture-id136521748?s=612x612';
             allBuses.add(newbus); 
             
         }
        List<Bus__c> allBuses2 = new  List<Bus__c>();
         for (integer i=1;i<=count;i++){     
       		 Bus__c newbus =  new  Bus__c();
        	 newbus.Air_conditioner__c = true;
        //	 newbus.Odometer_Records__c = 160000;
        	 newbus.Year__c = 2000;
        	 newbus.Maximum_Capacity__c='36';
        	 newbus.Current_Status__c = 'Ready For Use';
              newbus.Bus_Image__c='https://ichef.bbci.co.uk/news/976/cpsprodpb/4597/production/_110451871_bus2.jpg';
             
             allBuses.add(newbus); 
             
         }
        List<Bus__c> allBuses3 = new  List<Bus__c>();
         for (integer i=1;i<=count;i++){     
       		 Bus__c newbus =  new  Bus__c();
        	 newbus.Air_conditioner__c = true;
        	// newbus.Odometer_Records__c = 160000;
        	 newbus.Year__c = 1972;
        	 newbus.Maximum_Capacity__c='36';
        	 newbus.Current_Status__c = 'Ready For Use';
              newbus.Bus_Image__c='https://www.sustainable-bus.com/wp-content/uploads/2019/12/scania-bus4.jpg';
             allBuses.add(newbus);
         }
        List<Bus__c> allBuses4 = new  List<Bus__c>();
         for (integer i=1;i<=count;i++){     
       		 Bus__c newbus =  new  Bus__c();
        	 newbus.Air_conditioner__c = true;
        	// newbus.Odometer_Records__c = 160000;
        	 newbus.Year__c = 1972;
        	 newbus.Maximum_Capacity__c='24';
        	 newbus.Current_Status__c = 'Ready For Use';
             newbus.Bus_Image__c='https://ichef.bbci.co.uk/news/976/cpsprodpb/4597/production/_110451871_bus2.jpg';
             allBuses.add(newbus); 
         }
        
        allBuses.addall(allBuses1);
        allBuses.addall(allBuses2);
        allBuses.addall(allBuses3);
        allBuses.addall(allBuses4);

      System.debug(allBuses);
      return allBuses;
    }
}