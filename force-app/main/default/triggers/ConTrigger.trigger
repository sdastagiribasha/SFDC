/*Trigger to prevent duplicate contacts on basis of Email & Phone Number
*/
trigger ConTrigger on Contact (before insert) {
    Set<String> emailSet = new Set<String>();
    Set<String> phoneSet = new Set<String>();
    for(Contact con: trigger.new){
        emailSet.add(con.Email);
        phoneSet.add(con.Phone);
    }
    List<Contact> conList = new List<Contact>([Select Id, Name, Phone, Email
                                               FROM Contact
                                               WHERE Email IN :emailSet
                                               OR
                                               Phone IN :phoneSet]);
    
    for(Contact contact: trigger.new){
        if(conList.size()>0){
            contact.email.addError('Duplicate email');
            contact.phone.addError('Duplicate phone');
            System.debug('**********inside Trigger');
        }
    }
}