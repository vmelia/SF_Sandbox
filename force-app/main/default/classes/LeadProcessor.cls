public without sharing class LeadProcessor implements Database.Batchable<SObject>
{
    public Database.QueryLocator start(Database.BatchableContext context){
        return Database.getQueryLocator([SELECT Id, Name FROM Lead]);
    }

    public void execute(Database.BatchableContext context, List<Lead> leads){
        for (Lead l: leads){
            l.LeadSource = 'Dreamforce';
        }
        update leads;
    }

    public void finish(Database.BatchableContext context){
        System.debug('LeadProcessor.finish()');
    }
}