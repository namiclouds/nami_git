public class multiselectexample {
    public List<string> cities                	 {set; get;}
    public set<string> selectedcities 		   	 {set; get;}
    public set<string> nonselectedcities 	     {set; get;}
    public List <selectoption> selectedoptions   {set; get;}
     public List <selectoption> nonselectedoptions {set; get;}
    public List<string> selected                   {set; get;}
    public List<string> removed                   {set; get;}
    public multiselectexample (){
        cities = new list <string > {'hyd', 'bang', 'che', 'pune'};
        selectedcities = new set <string> ();
        nonselectedcities = new set <string> ();
        selectedoptions = new list <selectoption> ();
        nonselectedoptions= new list<selectoption> ();
        nonselectedcities.addall (cities);

        getdata ();
    }
    public void getdata (){
        nonselectedoptions.clear ();
        selectedoptions.clear();
        selectoption n = new selectoption ('none', '-None-') ;
        if (selectedcities.size()> 0){
            for (string s1 :selectedcities ){
                selectoption OP1  = new selectoption(s1,s1);
                    selectedoptions.add (OP1);
            }}
            else {
                selectedoptions.add (n);
            }
            if (nonselectedcities.size()> 0){
                 for (string s2 :nonselectedcities ){
                selectoption OP2  = new selectoption(s2,s2);
                    nonselectedoptions.add (OP2);
                 }}
                else {
                nonselectedoptions.add(n);
                }
        }
    public void add (){
        nonselectedcities.removeall(selected);
        selectedcities.addall(selected);
        getdata ();
    }
     public void deleteele (){
        selectedcities.removeall(removed);
       nonselectedcities.addall(removed);
         getdata ();
    }
}