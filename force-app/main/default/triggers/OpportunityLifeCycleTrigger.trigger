trigger OpportunityLifeCycleTrigger on Opportunity(after insert) {
  if (Trigger.isAfter && Trigger.isInsert) {
    List<Task> taskList;

    taskList = new List<Task>();
    for (Opportunity opp : Trigger.new) {
      Task task = new Task(
        Subject = 'New Opportunity is created Named ' + opp.Name,
        Priority = 'Normal',
        OwnerId = opp.OwnerId,
        WhatId = opp.id
      );
      taskList.add(task);
    }
    try {
      insert taskList;
    } catch (Exception e) {
      system.debug('ERROR ' + e.getMessage());
    }
  }
}
