@isTest
private class AccountManagerTest {

    @isTest static void getAccountTest() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = 'https://developersandbox21-dev-ed.develop.my.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;

        Account account = AccountManager.getAccount();

        Assert.isTrue(account != null);
        Assert.areEqual('test-account', account.Name);
    }

    static Id createTestRecord() {
        // Create test record
        Account account = new Account(Name='test-account');
        insert account;

        Contact contact = new Contact (
            FirstName = 'first-name', 
            LastName = 'last-name',
            AccountId = account.Id
        );
        insert contact;
        
        return account.Id;
    }
}