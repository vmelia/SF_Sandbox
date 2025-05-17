trigger CaseTrigger on Case (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        CaseTriggerHandler.checkCases(Trigger.New);
    }
}