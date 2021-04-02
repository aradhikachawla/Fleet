public with sharing class BatchMainClass {

    @invocableMethod
    public static void callBatchClass(){
        BatchClassForMaintanance b= new BatchClassForMaintanance();
        Database.executeBatch(b);
    }
    
}