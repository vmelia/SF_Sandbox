trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();

    for(opportunity o : Trigger.new) {
        // Condition: Stage is Closed Won
        if (o.StageName == 'Closed Won'){
            // Operation: Create a task.
            Task task = new Task(Subject = 'Follow Up Test Task', WhatId = o.Id);
            tasks.add(task);
        }
    }

    if (tasks.size() > 0) {
        insert tasks;
    }
}