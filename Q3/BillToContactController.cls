public class BillToContactController {
    public List<Contact> accountContacts{get{
        if(accountContacts==null){
            return new List<Contact>();
        }
        return accountContacts;
    }
   	set;}
  	public String contact {get;set;}
    private Opportunity opp;
    public BillToContactController(){
        Id oId = ApexPages.currentPage().getParameters().get('id');
        system.debug('Id'+oId);
        if(oId != null){
            opp=[select Id,Manager__C,BillToContact__c from Opportunity where id=:oId limit 1];
            Account manager = [select Id,(select Id, Name from contacts) from account where id=:opp.Manager__c limit 1];
            this.contact=opp.BillToContact__c;
            accountContacts=manager.contacts;
        }  
        system.debug('Acc'+accountContacts);
    }
    public List<SelectOption> getContactOptions(){
        List<SelectOption> contactOptions= new List<SelectOption>();
        for(Contact contact:accountContacts){
            contactOptions.add(new SelectOption(contact.Id,contact.Name));
        }
        return contactOptions;
    }
	Public pagereference save()
	{
        opp.BillToContact__c= this.contact;
        update opp;
        return new ApexPages.StandardController(opp).view();
	}
    public PageReference clear(){
          opp.BillToContact__c=null;
        	update opp;
        contact=null;
        return new PageReference('/apex/BillToContactPage?id='+opp.id);
    }
     public PageReference cancel(){
        return new ApexPages.StandardController(opp).view();
    }


}