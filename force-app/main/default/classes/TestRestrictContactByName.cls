@isTest
private class TestRestrictContactByName {
  @isTest
  static void TestInsertContactWithInvalidName() {
    Contact contact = new Contact(LastName ='INVALIDNAME');

    Test.startTest();
      Database.SaveResult result = Database.insert(contact, false);
    Test.stopTest();

    System.assert(!result.isSuccess());
    System.assert(result.getErrors().size() > 0);
    System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
      result.getErrors()[0].getMessage());
  }
  
  @isTest
  static void TestUpdateContactWithInvalidName() {
    Contact contact = new Contact(LastName ='ValidName');

    Test.startTest();
      Database.insert(contact, false);
      contact.LastName = 'INVALIDNAME';
      Database.SaveResult result = Database.update(contact, false);     
    Test.stopTest();

    System.assert(!result.isSuccess());
    System.assert(result.getErrors().size() > 0);
    System.assertEquals('The Last Name "INVALIDNAME" is not allowed for DML',
      result.getErrors()[0].getMessage());
  }
  
  @isTest
  static void TestInsertContactWithValidName() {
    Contact contact = new Contact(LastName ='Validname');

    Test.startTest();
      Database.SaveResult result = Database.insert(contact, false);
    Test.stopTest();

    System.assert(result.isSuccess());
    System.assert(result.getErrors().size() == 0);
  }
  
  @isTest
  static void TestUpdateContactWithValidName() {
    Contact contact = new Contact(LastName ='ValidName');

    Test.startTest();
      Database.insert(contact, false);
      contact.LastName = 'Alsovalidname';
      Database.SaveResult result = Database.update(contact, false);     
    Test.stopTest();

    System.assert(result.isSuccess());
    System.assert(result.getErrors().size() == 0);
  }
}