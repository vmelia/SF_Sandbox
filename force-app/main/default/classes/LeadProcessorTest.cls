@isTest
private class LeadProcessorTest {

    @isTest
    private static void testBatchClass() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
            leads.add(new Lead(LastName = 'Test Account', Company = 'Salesforce', Email = 'x@y.com', Phone = '01234012345'));
        }
        insert leads;

        Test.startTest();
        LeadProcessor processor = new LeadProcessor();
        Id batchId = Database.executeBatch(processor, 200);
        Test.stopTest();

        List<Lead> updatedLeads = [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'Lead record with incorrect LeadSource.');
    }
}