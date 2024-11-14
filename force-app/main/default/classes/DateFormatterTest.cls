@isTest
private class DateFormatterTest {
    @isTest
    static void getFormattedDate() {
        MockDateHelper helper = new MockDateHelper();
        helper.returnDate = Date.newInstance(1999, 12, 31);

        //fflib_ApexMocks apexMocks = new fflib_ApexMocks();
        //DateHelper helper = (DateHelper)apexMocks.mock(DateHelper.class);

        // Mocker mocker = Mocker.start.Stubbing();
        // DateHelper helper = mocker.mock(DateHelper.class);
        // mocker.when(helper.today()).thenReturn(Date.newInstance(1999, 12, 31));

        DateFormatter formatter = new DateFormatter(helper);

        String result = formatter.getFormattedDate();

        Assert.areEqual('31/12/1999', result, 'Expected 31/12/1999');
    }

    class MockDateHelper extends DateHelper{
        Date returnDate;
        public override Date today() {
            return returnDate;
        }
    }
}