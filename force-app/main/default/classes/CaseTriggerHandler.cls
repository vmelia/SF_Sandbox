public with sharing class CaseTriggerHandler {
	public static void checkCases(List<Case> cases){
        for (Case caseRec : cases) {
            // Check EmailMessages.
            String fosEmailCards = System.Label.FOS_Email_Cards;
            System.debug('**** fosEmailCards = ' + fosEmailCards);
        }
	} 

    public static void limitComplaintNatures(List<Case> cases){
        for (Case caseRec : cases) {
            if (caseRec.ComplianCards__c > 0 && caseRec.Nature__c == 'Complaint Card') {)
            System.debug('**** fosEmailCards = ' + fosEmailCards);
        }
	}   
}