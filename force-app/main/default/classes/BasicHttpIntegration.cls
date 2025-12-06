public with sharing class BasicHttpIntegration {

    public static Map<String, Object> send(String endpoint, String method, String body) {   
        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod(method);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody(body);

        Http http = new Http();  
        HttpResponse response = http.send(request);

        return new Map<String, Object>{ 
            'status' => response.getStatusCode(), 
            'body' => response.getBody()
        };
    }
}

// String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
// String method = 'GET';
// Map<String, Object> result = BasicHttpIntegration.send(endpoint, method);
// System.debug(result);

// String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
// String method = 'POST';
// String body = '{"name":"mighty moose"}';
// Map<String, Object> result = BasicHttpIntegration.send(endpoint, method, body);
// System.debug(result);