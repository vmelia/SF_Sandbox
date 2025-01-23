public with sharing class PropertyUtility {
    public static void newListedProperties() {
        List<Property__c> newPropList = [
            SELECT Name, Broker__r.Email__c, Days_on_Market__c
            FROM Property__c
            WHERE Days_on_Market__c <= 30
        ];

        for (Property__c p : newPropList){
            String propEmail = p.Name + ' : ' + p.Broker__r.Email__c;
            System.debug(propEmail);
        }
    }
}