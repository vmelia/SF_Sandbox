@IsTest
private class AccountWrapperTests {
  @IsTest
  static void testPositiveRoundedAveragePrice() {
    Account account = TestFactory.getAccount('ACME', true);
    List<Opportunity> opps = TestFactory.generateOppsForAccount(account.id, 100500.00, 5);
    insert opps;

    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);

    Test.startTest();
      Assert.areEqual(
        101000.00,
        acctWrapper.getRoundedAvgPriceOfOpps(),
        'Expected to get 101000.00');
    Test.stopTest();
  }

  @IsTest
  static void testIsHighPriority() {
    Account account = TestFactory.getAccount('ACME', true);
    List<Opportunity> opps = TestFactory.generateOppsForAccount(account.id, 100500.00, 5);
    insert opps;
    
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);

    Test.startTest();
      Assert.isTrue(acctWrapper.isHighPriority(), 'Expected to be high priority');
    Test.stopTest();
  }

  @IsTest
  static void testIsNotHighPriority() {
    Account account = TestFactory.getAccount('ACME', true);
    List<Opportunity> opps = TestFactory.generateOppsForAccount(account.id, 1000.00, 5);
    insert opps;
    
    Account acct = [SELECT Id FROM Account LIMIT 1];
    AccountWrapper acctWrapper = new AccountWrapper(acct);

    Test.startTest();
      Assert.isFalse(acctWrapper.isHighPriority(), 'Expected to be not high priority');
    Test.stopTest();
  }
}