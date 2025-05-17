@RestResource(urlMapping='/Accounts/*/contacts/')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        String accountId = request.requestURI.substringBetween('/Accounts/','/contacts');

        System.debug('accountId = ' + accountId);
        Account result = [Select Id, Name, (Select Id, Name FROM Contacts) FROM Account WHERE Id = :accountId LIMIT 1];

        return result;
    }
}