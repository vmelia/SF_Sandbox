@isTest
private class ParkLocatorTest {
    @isTest    
    static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        List<String> result = ParkLocator.country('text');

        Assert.areEqual(2, result.size());
    }
}