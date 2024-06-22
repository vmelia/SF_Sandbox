public with sharing class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accounts) {
        for (Account a : accounts) {
            if (a.ShippingState != a.BillingState){
                a.ShippingState = a.BillingState;
            }
        }
    }
}