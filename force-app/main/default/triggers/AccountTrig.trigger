/*-------------------------------------------------------------------------------------------------
Author:             SSIBTAIN
Date:               23-May-2018
Version:            1.0
Description:        Account Trigger
----------------------------------------------------------------------------------------------------*/

trigger AccountTrig on Account (after insert, after update, before insert, before update, before delete)
{
    /*
// Return if trigger is inactive from custom meta data type
Trigger_Active_Inactive_Flag__mdt objTrgActive = [Select Flag__c from Trigger_Active_Inactive_Flag__mdt where MasterLabel = 'AccountTrg'];
if(!objTrgActive.Flag__c ) return ;
*/
    AccountTrigHandler handler = new AccountTrigHandler();
    
    // Before Insert
    if(Trigger.isInsert && Trigger.isBefore)
    {
        handler.OnBeforeInsert(Trigger.new);
    }
    
    // After Insert
    else if(Trigger.isInsert && Trigger.isAfter)
    {
       // handler.OnAfterInsert(Trigger.new, Trigger.newMap);
    }
    
    // Before Update
    else if(Trigger.isUpdate && Trigger.isBefore)
    {
        //handler.OnBeforeUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
        handler.OnBeforeUpdate(Trigger.new);
    }
    
    // After Update
    else if(Trigger.isUpdate && Trigger.isAfter)
    {
        //handler.OnAfterUpdate(Trigger.old, Trigger.new, Trigger.oldMap, Trigger.newMap);
    }
    
    // before delete
    else if(Trigger.isdelete && Trigger.isBefore)
    {
       // handler.onBeforeDelete(Trigger.old, Trigger.oldMap);
    }
    
}