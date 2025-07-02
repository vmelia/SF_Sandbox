public with sharing class AccountHandler {
    public static void insertAccount(Integer count) {
        List<Account> addAccounts = new List<Account>();
        for (Integer index = 0;  index < count; index++){
            String accountName = 'Acme Inc ' + index;
            Account account = new Account(Name = accountName);
            addAccounts.add(account);
        }

        if (addAccounts.size() > 0) {
            insert addAccounts;
        }
    }
}