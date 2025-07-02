@IsTest
private class TaskUtilTests {

  @IsTest
  static void testGetTaskPriorityNormal() {
    Test.startTest();
    String taskPriority = TaskUtil.getTaskPriority('AA');
    Test.stopTest();

    Assert.areEqual('Normal', taskPriority, 'Task Priority should be Normal.');
  }

  @IsTest
  static void testGetTaskPriorityHigh() {
    Test.startTest();
    String taskPriority = TaskUtil.getTaskPriority('CA');
    Test.stopTest();

    Assert.areEqual('High', taskPriority, 'Task Priority should be High.');
  }
}