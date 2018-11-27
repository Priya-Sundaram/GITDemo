trigger AccountTrigger on Account (before insert, before update) {
    if(Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)){
        TriggerHandler_Account.updateShippingAddress(Trigger.new);
    }
}