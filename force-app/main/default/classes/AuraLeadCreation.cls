//Insertion of the Lead Record through Lightning
public class AuraLeadCreation
{
	@AuraEnabled
    public static Lead createRecord(Lead mylead)
    {
        upsert mylead;
        return mylead;
    }
}