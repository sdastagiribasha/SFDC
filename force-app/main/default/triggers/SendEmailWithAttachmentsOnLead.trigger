/*
	Whenever a Lead is Created, and attached some files to it, We need to send an Email to the Lead Email Address with Attachments.
*/
trigger SendEmailWithAttachmentsOnLead on Lead (after insert) {
	
    SendEmailWithAttachmentsOnLeadController.emailToLead(Trigger.New);
}