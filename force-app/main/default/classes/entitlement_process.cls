Public class entitlement_process{
public static void SetCaseEntitlements(List < Case > CaseData) {
        Map < String, Entitlement_Process__c > EntitlementMap = Entitlement_Process__c.getAll();
    system.debug('EntitlementMap'+EntitlementMap);
        List < Entitlement_Process__c > ep = EntitlementMap.values();
       system.debug('ep'+ep);
        for (Case ce: CaseData) {
                for (Entitlement_Process__c e: ep) {
                    if (ce.Priority!=null ) {
                        system.debug('CaseProgramType' + ce.Priority);
                        if(e.Priority__c.contains(ce.Priority)){
                           // system.debug('CustomSettingEntitlementId' + e.EntitlementId__c + e.Non_Stop__c);
                            ce.EntitlementId = e.EntitlementId__c;
                            break;
                        }
                    }
    

                
            }
        }
                           }
                           }