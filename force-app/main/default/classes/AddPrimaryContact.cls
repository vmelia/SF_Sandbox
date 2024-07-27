public without sharing class AddPrimaryContact implements Queueable {
    Contact contact;
    String state;

    public AddPrimaryContact(Contact inputContact,  String inputState){
        contact = inputContact;
        state = inputState;
    }

    public void execute(QueueableContext context){
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> contacts = new List<Contact>();

        for (Account acc: accounts){
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}