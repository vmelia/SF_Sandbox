@IsTest
private class PermissionsTests {
  @TestSetup
  static void testSetup() {
    Account acct = TestFactory.getAccount('No view For You!', true);
    Private_Object__c privateObj = new Private_Object__c(Account__c = acct.id, Notes__c = 'foo');
    insert privateObj;
  }
  
  @IsTest
  static void testNegativePermissionSet() {
    User userNew = TestFactory.generateUser('Standard User');
    System.runAs(userNew) {
      Test.startTest();
        Private_Object__c[] privateObj = [SELECT Id, Account__c, Notes__c FROM Private_Object__c];
      Test.stopTest();

      Assert.areEqual(
        0,
        privateObj.size(),
        'A user without the permission set shouldn\'t see any records');
    }
  }

  @isTest 
  static void testPositivePermissionSet() {
    User userNew = TestFactory.generateUser('Standard User');
    PermissionSet ps = [
      SELECT Id
      FROM PermissionSet
      WHERE Name = 'Private_Object_Access'
    ];

    insert new PermissionSetAssignment(
        AssigneeId = userNew.id,
        PermissionSetId = ps.Id
    );

    System.runAs(userNew){
      Test.startTest();
      Private_Object__c[] privateObj = [SELECT Id, Account__c, Notes__c FROM Private_Object__c];
      Test.stopTest();

      Assert.areEqual(1, privateObj.size(), 'A user with the permission set should see one record');
    }
  }
}