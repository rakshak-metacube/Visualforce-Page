public class StudentPDFExtension {
 	private final Student__c st;
    
    public StudentPDFExtension(ApexPages.StandardController stdController) {
        this.st = (Student__c)stdController.getRecord();
    }
    
    public void attachadd(){
        PageReference pdf = page.studentpdf;
        pdf.getParameters().put('id',st.id);
        list<attachment> att=[select id from attachment where parentid=:st.id and name='StudentData.pdf'];
        if(att.size()!=0) delete att;
        insert new attachment(name='StudentData.pdf',parentid=st.id,body=pdf.getContent());
    }
}