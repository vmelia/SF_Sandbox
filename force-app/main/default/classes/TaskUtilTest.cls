@isTest
private class TaskUtilTest {


@IsTest
    static void testGetTaskPriority() {
        String priority = TaskUtil.getTaskPriority('NY');
        System.assertEquals('Normal', priority, 'Priority should be Normal');
        priority = TaskUtil.getTaskPriority('CA');
        System.assertEquals('High', priority, 'Priority should be High');
        priority = TaskUtil.getTaskPriority('AB');
        System.assertEquals(null, priority, 'Priority should be null');
    }
}