trigger OpportunityTrigger on Opportunity (after insert, after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        TriggerHandler_Opportunity.doPostActions(Trigger.new, Trigger.oldMap);
    }
}