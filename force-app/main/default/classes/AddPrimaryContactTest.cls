@isTest
private class AddPrimaryContactTest {

    @isTest
    private static void testAddPrimaryContactClass() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 50; i++){
            accounts.add(new Account(Name = 'Test Account NY' + i, BillingState = 'NY'));
            accounts.add(new Account(Name = 'Test Account CA' + i, BillingState = 'CA'));
        }
        insert accounts;

        Contact contact = new Contact(FirstName='Vince', LastName='Melia');
        insert contact;

        Test.startTest();
        Id jobId = System.enqueueJob(new AddPrimaryContact(contact, 'CA'));
        Test.stopTest();

        List<Contact> contacts = [SELECT Id FROM Contact WHERE Contact.Account.BillingState = 'CA'];
        System.assertEquals(50, contacts.size(), 'Error.');
    }
}