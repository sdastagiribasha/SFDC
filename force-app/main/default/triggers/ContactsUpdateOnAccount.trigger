trigger ContactsUpdateOnAccount on Contact (before insert,before update,after insert,after update)
{
    if(Trigger.isAfter && Trigger.IsInsert)
    {
        UpdateNoOfContacts unc = new UpdateNoOfContacts();
        unc.countContacts(Trigger.New);
    }
}