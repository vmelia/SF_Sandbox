public with sharing class CaseController {
    @AuraEnabled(cacheable=true)
    public static List<Case> getCases(){        
        try {
            if (Case.SObjectType.getDescribe().isAccessible()) {
                return [SELECT Id, caseNumber, Priority, Subject, Status FROM Case];
            }
            return new List<Case>();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}