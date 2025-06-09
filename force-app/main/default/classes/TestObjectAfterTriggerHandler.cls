public with sharing class TestObjectAfterTriggerHandler {
    public static void execute(List<Test_Object__c> newRecords, String lastTrigger) {
        for(Test_Object__c record : newRecords){
            System.debug(record.Id + ' = ' + lastTrigger);
        }
    }
}