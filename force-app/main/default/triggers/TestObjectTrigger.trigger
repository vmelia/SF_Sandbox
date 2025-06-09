trigger TestObjectTrigger on Test_Object__c (before insert, after insert, before update, after update) {
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            TestObjectBeforeTriggerHandler.execute(Trigger.new, 'Before Insert');
        } else if (Trigger.isAfter) {
            TestObjectAfterTriggerHandler.execute(Trigger.new, 'After Insert');
        }       
    } else if (Trigger.isUpdate) {  
        if (Trigger.isBefore) {
            TestObjectBeforeTriggerHandler.execute(Trigger.new, 'Before Update');
        } else if (Trigger.isAfter) {
            TestObjectAfterTriggerHandler.execute(Trigger.new, 'After Update');
        } 
    }
}