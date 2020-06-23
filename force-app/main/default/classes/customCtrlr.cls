public class customCtrlr {
private Account theAccount;

public customCtrlr(){
    theAccount = [SELECT Id, Type FROM Account
                   WHERE Id = '0017F00001W6NLN'];
	system.debug('theAccount'+ theAccount);
	}
}