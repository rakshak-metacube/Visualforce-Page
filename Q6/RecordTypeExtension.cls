public class RecordTypeExtension {
    public String recordType{get;set;}
    
    public RecordTypeExtension(ApexPages.StandardController stdController){
        Contact c = ((Contact)stdController.getRecord());
        Recordtype r=[SELECT Name FROM RecordType where id=:c.RecordTypeId LIMIT 1];
        recordType=r.name +' Teacher';
        
    }
}