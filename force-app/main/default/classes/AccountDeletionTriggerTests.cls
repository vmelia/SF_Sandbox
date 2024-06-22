@IsTest
private class AccountDeletionTriggerTests {
  @IsTest
  static void testDeleteAccountWithOneOpportunity() {
    // GIVEN
    // Create one account with one opportunity by calling utility method
    Account acct = TestFactory.getAccount('ACME', true);
    List<Opportunity> opps = TestFactory.generateOppsForAccount(acct.id, 1000.00, 1);
    insert opps;
    // WHEN
    Test.startTest();
      Database.DeleteResult result = Database.delete(acct, false);
    Test.stopTest();
    // THEN
    // In this case the deletion should have been stopped by the trigger,
    // so verify that we got back an error.
    Assert.isFalse(result.isSuccess(), 'isSuccess should be false.');
    Assert.isTrue(result.getErrors().size() > 0, 'There should be errors.');
    Assert.areEqual(
        'Cannot delete account with related opportunities.',
        result.getErrors()[0].getMessage(),
        'Error message should be Cannot delete account...');
  }
}