@isTest
private class AccountTriggerTest {
    @isTest static void TestCreateNewAccountInBulk() {
        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i, BillingState = 'CA');
            accts.add(acct);
        }

        Test.startTest();
        insert accts;
        Test.stopTest();

        List<Account> verifyAccts = [SELECT Id, ShippingState FROM Account];
        Assert.areEqual(200, verifyAccts.size(), 'Expected 200 records.');
        for (Account a:verifyAccts){
            Assert.areEqual('CA', a.ShippingState, 'Expected ShippingState of CA');
        }
    }
}