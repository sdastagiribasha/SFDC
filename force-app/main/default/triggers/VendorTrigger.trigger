trigger VendorTrigger on Vendor__c (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    
    TriggerDispatcher.run(new VendorTriggerHandler(), 'VendorTrigger');
}