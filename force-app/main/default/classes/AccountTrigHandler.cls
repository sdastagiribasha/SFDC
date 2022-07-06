public class AccountTrigHandler {
    
    public void onBeforeInsert(List<Account> newObjects) {
        CustomDateController.updateLastModified(newObjects);
    }
    public void OnBeforeUpdate(List<Account> newObjects) {
        CustomDateController.updateLastModified(newObjects);
    }

}