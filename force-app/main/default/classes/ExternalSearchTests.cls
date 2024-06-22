@IsTest
private class ExternalSearchTests {
  @IsTest
  static void testPositiveMocking() {
    HTTPMockFactory mock = new HTTPMockFactory(200, 'OK', 'I found it!', new Map<String, String>());
    Test.setMock(HttpCalloutMock.class, mock);

    Test.startTest();
      String result = ExternalSearch.googleIt('epic search');
    Test.stopTest();

    Assert.areEqual('I found it!', result, 'Expected to receive mock response');
  }

  @IsTest
  static void testNegativeMocking() {
    HTTPMockFactory mock = new HTTPMockFactory(500, 'Not Found', 'I did not find it!', new Map<String, String>());
    Test.setMock(HttpCalloutMock.class, mock);

    Test.startTest();
    try {
        String result = ExternalSearch.googleIt('server issue');
    } catch(ExternalSearch.ExternalSearchException e){
      System.assertEquals('Did not receive a 200 status code: 500', e.getMessage(), 'Internal Server Error');
    }      
    
    Test.stopTest();
  }
}