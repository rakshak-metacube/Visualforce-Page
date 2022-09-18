public class JSONOutputExtension {
    public String op{get;set;}
    private final Student__c st;
    public JSONOutputExtension(ApexPages.StandardController stdController){
        this.st=(Student__c)stdController.getRecord();
        op=JSON.serialize([SELECT name FROM Student__c]);
    }
}