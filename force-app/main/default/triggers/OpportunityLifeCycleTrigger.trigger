trigger OpportunityLifeCycleTrigger on Opportunity(after insert) {
  if (Trigger.isAfter && Trigger.isInsert) {
    system.debug('TRIGGER MESSAGE ' + Trigger.new);
  }
}
