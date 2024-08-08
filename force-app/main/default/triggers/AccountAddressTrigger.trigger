trigger AccountAddressTrigger on Account (before insert, before update) {

    for(Account a : Trigger.new) {
        // Condition: Match Billing Address is true
        if (a.Match_Billing_Address__c){
            // Operation: set the Shipping Postal Code to match the Billing Postal Code
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}