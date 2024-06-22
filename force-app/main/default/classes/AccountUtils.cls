public with sharing class AccountUtils {
    public static List<Account> accountsByState(String stateAbbreviation) {
        return [SELECT Id, Name FROM Account WHERE billingState = :stateAbbreviation WITH SECURITY_ENFORCED];
    }
}