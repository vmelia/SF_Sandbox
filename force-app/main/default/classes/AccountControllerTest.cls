@isTest
private class AccountControllerTest {
    @isTest
    static void testGetAllActiveAccounts() {
        // Setup test data
        Account activeAccount = new Account(Name = 'Active Account', Active__c = 'Yes');
        Account inactiveAccount = new Account(Name = 'Inactive Account', Active__c = 'No');
        insert new List<Account>{ activeAccount, inactiveAccount };

        // Call method
        List<Account> activeAccounts = AccountController.getAllActiveAccounts();

        // Verify results
        System.assertEquals(1, activeAccounts.size());
        System.assertEquals(activeAccount.Id, activeAccounts[0].Id);
    }

    @isTest
    static void testGetAccount() {
        // Setup test data
        Account testAccount = new Account(Name = 'Test Account', AccountNumber = '12345');
        insert testAccount;

        // Call method
        Account retrievedAccount = AccountController.getAccount('12345');

        // Verify results
        System.assertNotEquals(null, retrievedAccount);
        System.assertEquals(testAccount.Id, retrievedAccount.Id);
    }
}
