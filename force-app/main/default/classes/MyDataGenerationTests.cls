@isTest
private class MyDataGenerationTests {
    @TestSetup
    static void dataCreation() {
        List<sObject> accounts = Test.loadData(Account.SObjectType, 'otherAccountData');
    }

    @isTest
    static void testLoadOtherAccountsFromStaticResource() {
        Test.startTest();
        List<Account> accts = [SELECT ID FROM Account];
        Test.stopTest();

        Assert.areEqual(15, accts.size(), 'Expected 15 accounts');
    }
}