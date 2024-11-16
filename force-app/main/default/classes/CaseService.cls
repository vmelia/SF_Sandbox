public with sharing class CaseService {
    public static CaseDao caseDao = new CaseDao();

    public static void closeCases(Set<Id> caseIds, String reason) {
        caseDao.closeCases(caseIds, reason);
    }

    public with sharing class CaseDao
    {   
        public void closeCases(Set<Id> caseIds, String reason) 
        {
            List<Case> cases = [
                SELECT Id, Status, Reason 
                FROM Case 
                WHERE Id IN :caseIds 
                WITH SECURITY_ENFORCED
            ];

            for(case caseRec: cases){
                caseRec.Status = 'Closed';
                caseRec.Reason = reason;
            }

            update cases;
        }
    }
}