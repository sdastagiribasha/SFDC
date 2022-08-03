trigger ContactPhoneUpdateOnAccount on Contact (before insert,before update,after insert,after update) 
{
    if(Trigger.Isafter && Trigger.Isupdate)
    {   
        /*
        ContactPhoneUpdate cpu = new ContactPhoneUpdate();
        Cpu.AccountPhoneUpdate(Trigger.New);
        */
 
        ContactPhoneUpdateOnAccount.updatePhone(Trigger.New);
    }
}