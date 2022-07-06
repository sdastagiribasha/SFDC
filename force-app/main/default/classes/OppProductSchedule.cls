global class OppProductSchedule implements Schedulable 
{
	global void execute(SchedulableContext ctx)
    {
		OppertunityProductCreation opc = new OppertunityProductCreation();
        id jobid = database.executeBatch(opc);
        
    }
}