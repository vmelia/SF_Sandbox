public with sharing class CaseTriggerHandler {
	public static void checkCases(List<Case> cases){
        for (Case caseRec : cases) {
            // Check EmailMessages.
            String fosEmailCards = System.Label.FOS_Email_Cards;
            System.debug('**** fosEmailCards = ' + fosEmailCards);
        }
	} 
}