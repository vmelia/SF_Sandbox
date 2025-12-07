@isTest
private class BasicHttpIntegrationTest {
    
    @IsTest
    static void testHttpGet() {
        // Set up mock response
        Test.setMock(HttpCalloutMock.class, new MockHttpResponse());
        
        // Make HTTP GET request
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.example.com/data');
        request.setMethod('GET');
        request.setTimeout(10000);
        
        Http http = new Http();
        HttpResponse response = http.send(request);
        
        // Assert response
        System.assertEquals(200, response.getStatusCode());
        System.assertNotEquals(null, response.getBody());
    }
    
    // Mock HTTP response class
    private class MockHttpResponse implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"status":"success"}');
            response.setStatusCode(200);
            return response;
        }
    }
}