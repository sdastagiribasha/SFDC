trigger AccTrig on Account (after insert,after update) {
    AccountTriggerHandler.updatePhoneOnContact(Trigger.New, Trigger.OldMap);
}