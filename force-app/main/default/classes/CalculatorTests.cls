@isTest
private class CalculatorTests {
    @isTest
    static void testDivideByZero() {
        try{
            Test.startTest();
            Calculator.divide(99, 0);
            Assert.fail('An exception should have been thrown');
            Test.stopTest();
        } catch (Calculator.CalculatorException e) {
            // THEN
            Assert.isTrue(
              e.getMessage().equalsIgnoreCase('You still can\'t divide by zero'),
              'Exception message does not match: ' + e.getMessage()
            );
          }
    }

    @isTest
    static void testAdd() {
        Test.startTest();
        Integer actual = Calculator.add(6, 2);
        Test.stopTest();

        Assert.areEqual(8, actual, '6 + 2 should equal 8');
    }

    @isTest
    static void testSubtract() {
        Test.startTest();
        Integer actual = Calculator.subtract(6, 2);
        Test.stopTest();

        Assert.areEqual(4, actual, '6 - 2 should equal 4');
    }

    @isTest
    static void testMultiply() {
        Test.startTest();
        Integer actual = Calculator.multiply(6, 2);
        Test.stopTest();

        Assert.areEqual(12, actual, '6 * 2 should equal 12');
    }

    @isTest
    static void testDivide() {
        Test.startTest();
        Decimal actual = Calculator.divide(6, 2);
        Test.stopTest();

        Assert.areEqual(3, actual, '6 / 2 should equal 3');
    }
}