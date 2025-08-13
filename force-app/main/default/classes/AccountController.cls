public with sharing class AccountController {
  public static List<Account> getAllActiveAccounts() {
    return [SELECT Id, Name, Active__c FROM Account WHERE Active__c = 'Yes' WITH SECURITY_ENFORCED];
  }

  public static Account getAccount(String accountNumber) {
    List<Account> accounts =  [SELECT Id, Name FROM Account WHERE AccountNumber = :accountNumber WITH SECURITY_ENFORCED LIMIT 1];
    return accounts.size() > 0 ? accounts[0] : null;
  }
}