public class Myextension1 {
    public String inputdate;
        
 
    public  void setinputdate(String value){
        System.debug('value='+value);
        Date d=Date.parse(value);
        //Datetime dt2 = Datetime.newInstance(d.year(), d.month(),d.day());
       // this.inputdate=dt2.format('dd/MM/YYYY');
        system.debug('this.inputdate='+this.inputdate);
        
        
    }
    public String getinputdate(){
        return 'Jay';
    }
    public Myextension1(ApexPages.StandardSetController ctrl){
        
    }
    public Myextension1(){
        system.debug('inside const');
       // inputdate.format('dd-MM-yyyy');

    }
}