@isTest
private class UnitOfWorkTest {
    @isTest
    static void challengeComplete() {
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
        new Schema.SObjectType[] {
            Account.SObjectType,
            Contact.SObjectType,
            Note.SObjectType}
        );

        for(Integer i=0; i<100; i++) {
            Account accountRec = new Account(Name = 'Test ' + i);
            uow.registerNew(accountRec);

            for(Integer j=0; j<5; j++) {
                Contact contactRec = new Contact(AccountId = accountRec.Id, LastName = 'Smith');
                uow.registerNew(contactRec, Contact.AccountId, accountRec);
        
                Note noteRec = new Note(ParentId=accountRec.Id, Title='Title');
                uow.registerNew(noteRec, Note.ParentId, accountRec);
            }
        }

        uow.commitWork();

        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());
    }
}