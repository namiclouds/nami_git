public with sharing class MyController1 {
public Boolean rend { get; set; }
public MyController1 ()
{
rend = false;
}

    

    public PageReference commandLinkAction() {
    rend = true;
        return null;
    }

}