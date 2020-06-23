public with sharing class  cc2 {
    public list<account> getlistAcc(){
        List<Account> myacc=[SELECT ID, Name From Account];
        Return myacc;    
    }
    public list<opportunity> getlistopp(){
        List<opportunity> myopp=[SELECT ID, Name From opportunity];
        Return myOpp; 

    }
}