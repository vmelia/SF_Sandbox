public without sharing class FinancialCheckCaseUpdater {

    private static final String CASE_ORIGIN_ONBOARDING = 'Onboarding';
    private static final String CASE_ORIGIN_MONITORING = 'Monitoring';
    private static final String CASE_REASON_SCREENING = 'Screening';

    // If Origin = Onboarding:
    //  Has Sanction,   Priority = '20'.
    //  No Sanction,    Priority = '50'.
    // If Origin = Monitoring and Reason = Screening:
    //  Has Sanction,   Priority = '10'.
    //  No Sanction,    Priority = '50'.
    @testVisible
    private static String updateCasePriority(String origin, String reason, Boolean hasSanction) {
        if (origin == CASE_ORIGIN_ONBOARDING) {
            return hasSanction ? '20' : '50';
        } else if (origin == CASE_ORIGIN_MONITORING && reason == CASE_REASON_SCREENING) {
            return hasSanction ? '10' : '50';
        }

        return '';
    }
}