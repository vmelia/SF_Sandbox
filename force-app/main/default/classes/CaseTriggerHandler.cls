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
            if (String.isBlank(caseRec.Complaint_Natures__c)) continue;
            
            List<String> natures = caseRec.Complaint_Natures__c.split(';');
            if (Langs.size() > 5){
                caseRec.addError('You may only add up to 5 Complaint Natures.');
            }
        }
	}   
}