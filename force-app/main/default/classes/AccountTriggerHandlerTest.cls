@isTest
private class AccountTriggerHandlerTest {


@IsTest
    public static void testCreateAccounts() {
        List<Account> accounts = new List<Account>();
        Account a1 = new Account(Name='Test Account 1', BillingState='CA');
        Account a2 = new Account(Name='Test Account 2', BillingState='NY');
        accounts.add(a1);
        accounts.add(a2);
        insert accounts;
        
        Test.startTest();
        AccountTriggerHandler.CreateAccounts(accounts);
        Test.stopTest();

        List<Account> updatedAccounts = [SELECT Id, ShippingState FROM Account WHERE Id IN :accounts];
        System.assertEquals('CA', updatedAccounts[0].ShippingState);
        System.assertEquals('NY', updatedAccounts[1].ShippingState);
    }
}