public class UpdateContact{

    @InvocableMethod(label = 'Update Contacts')
    public static void updateContacts(List<Contact> contacts){
        contacts[0].put('Description', 'The description is updated');
        update contacts;
    }
}