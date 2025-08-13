public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {
        // To test error handling:
        // throw new AuraHandledException('Forced error');
        return [
            SELECT FirstName, LastName, Email
            FROM Contact
            WITH SECURITY_ENFORCED
            ORDER BY LastName
            LIMIT 1000
        ];
    }
}