public without sharing class DailyLeadProcessor implements Schedulable{
    public void execute(SchedulableContext context){
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        for (Lead l: leads){
            l.LeadSource = 'Dreamforce';
        }

        update leads;
    }
}