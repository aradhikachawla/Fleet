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

trigger CalculateResaleValue on Bus__c (before insert, before update) {
    
    if( (Trigger.isBefore && Trigger.isInsert) || (Trigger.isBefore && Trigger.isUpdate)){
        CalculateResaleValueHelper.calculateResale(Trigger.new);
    }
    
    
}