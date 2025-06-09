public with sharing class TestObjectBeforeTriggerHandler {
    public static void execute(List<Test_Object__c> newRecords, String lastTrigger) {
        for(Test_Object__c record : newRecords){
            record.Last_Trigger__c = lastTrigger;
            System.debug(record.Id + ' = ' + lastTrigger);
        }
    }
}