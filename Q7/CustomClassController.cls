public class CustomClassController {
    public List<Class__c> classes{get;set;}
    public Id clsId{get;set;}
    public Class__c c{get;set;}
    public boolean render{get;set;}
    public CustomClassController(){
        classes=[Select id,Name from class__c];
        c=new Class__c();
        render=false;
    }
    public List<Class__c> getClasses(){
        render=false;
        return classes;
    }
    public PageReference methodEdit() {
        this.render=true;
        system.debug(render);
        Id clsId=ApexPages.currentPage().getParameters().get('firstParam');
        c=[Select Id,Name,board__c,fee__c,max_size__c FROM Class__c WHERE Id=:clsId LIMIT 1];
        return null;
    }
    public PageReference methodDelete() {
        Id clsId=ApexPages.currentPage().getParameters().get('firstParam');
        c=[Select Id,Name,board__c,fee__c,max_size__c FROM Class__c WHERE Id=:clsId LIMIT 1];
        Delete c;
        classes=[Select id,Name from class__c];
        render=false;
        return null;
        
    }
    public PageReference save(){
        render=false;
        update c;
        return null;
    }
    public PageReference cancel(){
        render=false;
        return null;
    }
    
}