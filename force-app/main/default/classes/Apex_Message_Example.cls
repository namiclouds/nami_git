/** Message :
 * 1. It is the predefined class
 * 2. This apex class is defined in the namespace of Apexpages
 * 3. This is used to print message on the VF page or throw validation errors on the pages.
 * Syntax: ApexPages.Message(Type, ErrorMessage)
 *       : Error, Info, Confirm, Warning, FATAL
 * 
 * Severity:
 * 1. It is the enum value.
 * 2. It contains the values ERROR, Warning , INFO, CONFIRM
 * 
 * 
 * */


public class Apex_Message_Example {
    public Apex_Message_Example(){
        ApexPages.Message msg1=new ApexPages.Message(ApexPages.Severity.ERROR, 'I am Error');
        ApexPages.Message msg2=new ApexPages.Message(ApexPages.Severity.WARNING, 'I am Warning');
        ApexPages.Message msg3=new ApexPages.Message(ApexPages.Severity.INFO, 'I am Info');
        ApexPages.Message msg4=new ApexPages.Message(ApexPages.Severity.CONFIRM, 'I am confirm');
        ApexPages.addMessage(msg1);// add the message to the VF page that can be shown using <apex:pageMessages /> 
        ApexPages.addMessage(msg2);
        ApexPages.addMessage(msg3);
        ApexPages.addMessage(msg4);
    }
}