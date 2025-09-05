
@isTest
private class CaseCheckerTest {

    @isTest
    static void shouldFailValidation_false() {
        Assert.isFalse(CaseChecker.shouldFailValidation('Closed', 'Redo'), 'Expected false');
    }

    @isTest
    static void shouldFailValidation_true_wasClosed() {
        Assert.isTrue(CaseChecker.shouldFailValidation('Closed', 'Closed'), 'Expected true');
        Assert.isTrue(CaseChecker.shouldFailValidation('Closed', 'Open'), 'Expected true');
    }

    @isTest
    static void shouldFailValidation_true_wasRedo() {
        Assert.isTrue(CaseChecker.shouldFailValidation('Redo', 'Closed'), 'Expected true');                                
        Assert.isTrue(CaseChecker.shouldFailValidation('Redo', 'Redo'), 'Expected true');                                
        Assert.isTrue(CaseChecker.shouldFailValidation('Redo', 'Open'), 'Expected true');                               
    }

    @isTest
    static void shouldFailValidation_true_wasOpen() {                               
        Assert.isTrue(CaseChecker.shouldFailValidation('Open', 'Closed'), 'Expected true');
        Assert.isTrue(CaseChecker.shouldFailValidation('Open', 'Redo'), 'Expected true');
        Assert.isTrue(CaseChecker.shouldFailValidation('Open', 'Open'), 'Expected true');
    }
}