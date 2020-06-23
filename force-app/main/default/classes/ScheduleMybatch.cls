global class ScheduleMybatch implements Schedulable {   
 global void execute(SchedulableContext sc) {
      Mybatch b = new Mybatch(); 
      database.executebatch(b,120);
     multiselectexample m=new multiselectexample();
     m.add();
     
   }
}