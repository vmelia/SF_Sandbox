public without sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        // if (!Schema.sObjectType.Account.fields.Number_Of_Contacts__c.isUpdateable()) {
        //     return;
        // }
        
        List<Account> accounts = [
            SELECT Id, 
            (SELECT Id FROM Contacts)
            FROM Account 
            WHERE Id IN :accountIds
            WITH SECURITY_ENFORCED
        ]; 

        for (Account acc: accounts){
            acc.Number_Of_Contacts__c = acc.Contacts.size();
        }

        update accounts;
    }
}