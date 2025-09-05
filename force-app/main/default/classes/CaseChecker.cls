public with sharing class CaseChecker {
    public static Boolean shouldFailValidation(String oldStatus, String newStatus) {
        return !( oldStatus == 'Closed' && newStatus == 'Redo');
    }
}

//return oldStatus != 'Closed' && newStatus != 'Redo';
//return !( oldStatus == 'Closed' && newStatus == 'Redo');