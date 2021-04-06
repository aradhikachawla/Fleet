/*Build trigger logic to calculate resale value. The business wants to record the resale value of the
bus and have that be stored on the record.
Resale Value is determined by:
● If the bus is a 24 passenger, the starting selling price is $120,000
● If the bus is a 36 passenger, the starting selling price is $160,000
● It should only be considered if it's current status is "Ready for Use"
● For every mile over 100,000 on the odometer, the price is reduced by $.10
● If the bus has an air conditioning system, Increase the starting selling price by 3%
● If the bus year is 1972 or older, consider it historic. Increase the starting selling price by
34%
*/

public with sharing class CalculateResaleValueHelper {

    public static void calculateResale(List<Bus__c> listBuses){
        System.debug('CalculateResaleValueHelperTrigger');
       
         
        System.debug('after CalculateResa: '+ listBuses );
        
        for (Bus__c busResale : listBuses){
            
        decimal sellPrice;
        decimal resale;
            
            System.debug('sellPrice:='+ sellPrice);
            
            if(busResale.Maximum_Capacity__c == '24' && busResale.Current_Status__c == 'Ready For Use'){
               		sellPrice = 120000;
                    resale = 0;
                	if (busResale.Odometer_Reading__c!=null &&busResale.Odometer_Reading__c>100000 ){
            			resale = sellPrice - (busResale.Odometer_Reading__c - 100000)*0.10  ; 
                	}
            		if (busResale.Air_conditioner__c){
            	 		resale = resale + sellPrice *.03 ;
           			 }
		          	if  (busResale.Year__c == 1972){
                		resale = resale + sellPrice * .34 ;
           			 }

            		busResale.Resale_Value__c = resale;
            }
            
            else if (busResale.Maximum_Capacity__c == '36' && busResale.Current_Status__c == 'Ready For Use'){
               		sellPrice = 160000;
                	if (busResale.Odometer_Reading__c!=null && busResale.Odometer_Reading__c>100000 ){
            			resale = sellPrice - (busResale.Odometer_Reading__c - 100000)*0.10;
                	}
             		if (busResale.Air_conditioner__c){
            			resale = resale + sellPrice *.03 ;
            		}
            		if (busResale.Year__c == 1972){
                		resale = resale + sellPrice * .34 ;
            		}
            		busResale.Resale_Value__c = resale;
            }
        }
    }
        
            
    
    
    
			/* public static void calculate(List<Bus__c> listBus, decimal sellPrice){
                for (Bus__c busResale : listBus){
                decimal resale;
                resale = sellPrice - (busResale.Odometer_Reading__c - 100000)*0.10;
             		if (busResale.Air_conditioner__c){
            			resale = resale + sellPrice *.03 ;
            		}
            		if (busResale.Year__c == 1972){
                		resale = resale + sellPrice * .34 ;
            		}
            		busResale.Resale_Value__c = resale;
                }
             }*/
    
}