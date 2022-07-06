// Display standard fields and buttons of Lead in custom VF Page using controller 
public with sharing class StandardFieldsUsingController
{
  public Lead mylead{set;get;}
 public StandardFieldsUsingController ()
 {
    mylead = new Lead();
 }   
 public void create()
 {
     insert mylead;
 }
 public void refresh()
 {
     mylead = new Lead();
 }
 public void saveAndNew()
 {
    insert mylead;
    mylead = new Lead();
 }
}