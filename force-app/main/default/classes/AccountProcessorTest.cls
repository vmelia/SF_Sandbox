@isTest
public class AccountProcessorTest {
    @isTest
    public static void countContactsTest() {
        // Arrange.
        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 300; i++){
            accounts.add(new Account(Name = 'Test Account' + i));
        }
        insert accounts;

        List<Contact> contacts = new List<Contact>();
        List<Id> accountIds = new List<Id>();

        for (Account acc: accounts) {
            contacts.add(new Contact(
                FirstName = acc.Name,
                LastName = 'Test Contact',
                AccountId = acc.Id));

                accountIds.add(acc.Id);
        }
        insert contacts;

        // Act.
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();    // Forces execution of asynchronous code.

        //Assert.
        List<Account> accs = [SELECT Id, Number_Of_Contacts__c FROM Account];
        for (Account acc: accs) {
            System.assertEquals(1, acc.Number_Of_Contacts__c, 'Account record with incorrect number of contacts.');
        }
    }
}