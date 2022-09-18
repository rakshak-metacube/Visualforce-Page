public class searchcontroller {
    String billCity,billState,billCountry;
    Public Integer noOfRecords{get; set;}
    Integer Num;
    Public Integer size{get;set;}
    public SearchController(){
        size=10;
    }
    public Integer getNum(){
        return Num;
    }
    public void setNum(Integer n){
       Num=n;
    }
    public String getBillCity(){
        return billCity;
    }
    public void setBillCity(String c){
        billCity=c;
    }
    public String getBillState(){
        return billState;
    }
    public void setBillState(String s){
        billState=s;
    }
    public String getBillCountry(){
        return billCountry;
    }
    public void setBillCountry(String c){
        billCountry=c;
    }
    public void searchCustom(){
        String Query = 'SELECT Name,billingcity,billingstate,billingcountry FROM Account';
        String filter = '';
        String limits='';
        boolean b = false;
        if(String.isNotBlank(billcity)) {
            filter += 'billingCity LIKE\'' + billcity + '%\' ';
        }
        if(String.isNotBlank(billstate)) {
            if(String.isNotBlank(filter))
            {
                filter += 'AND billingState LIKE\'' + billstate + '%\' ';
            }
            else {
                filter += 'billingState LIKE\'' + billstate + '%\' ';
            }
        }
        if(String.isNotBlank(billCountry)) {
            if(String.isNotBlank(filter)) {
                filter += 'AND billingCountry LIKE\'' + billCountry + '%\' ';    
            }
            else {
                filter += 'billingCountry LIKE\'' + billCountry + '%\' ';
            }
        }

        if(Num > 0) {
            limits= ' LIMIT ' + Num;
            
        }
        if(String.isNotBlank(filter)) {
            Query = Query + ' where ' +  filter;
            System.debug('Query ' + Query);
        }
        if(String.isNotBlank(limits)){
            Query=Query+limits;
        }
        system.debug(query);
        setCon = new ApexPages.StandardSetController(Database.getQueryLocator(Query));
        setCon.setPageSize(size);  
        noOfRecords = setCon.getResultSize();
    }
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name,billingcity,billingstate,billingcountry FROM Account]));
                setCon.setPageSize(size);  
                noOfRecords = setCon.getResultSize();
            }
            
            return setCon;
        }
        set;
    }
    public PageReference refreshPageSize() {
         setCon.setPageSize(10);
         return null;
    }
    public List<Account> getAccount() {
        return (List<Account>) setCon.getRecords();
    }

}