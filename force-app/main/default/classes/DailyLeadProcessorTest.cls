@isTest
private class DailyLeadProcessorTest {
    private static String cronExp = '0 0 0 ? * * *';  // Midnight daily.

    @isTest
    private static void testDailyLeadProcessorClass() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 100; i++){
            leads.add(new Lead(LastName='last-name', Company='company', Email='x@y.com', LeadSource = 'non-blank'));
            leads.add(new Lead(LastName='last-name', Company='company', Email='x@y.com', LeadSource = ''));
        }
        insert leads;

        Test.startTest();
        String jobId = System.schedule('Process', cronExp, new DailyLeadProcessor());
        Test.stopTest();

        leads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(100, leads.size(), 'Error.');
    }
}