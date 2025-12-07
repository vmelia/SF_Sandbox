public with sharing class BasicHttpIntegration {

    public static Map<String, Object> send(final String endpoint, final String method, final String body) {   
        HttpRequest request = createRequest(endpoint, method, body);
        Http http = new Http();  

        System.debug(Json.serializePretty(request));
        HttpResponse response = http.send(request);
        System.debug(Json.serializePretty(response));

        return convertResponse(response);
    }

    public static Map<String, Object> send(final String endpoint, final String method, final Map<String, Object> body) {   
        return send(endpoint, method, Json.serialize(body));
    }

    public static Map<String, Object> send(final String endpoint, final String method, final Object body) {   
        return send(endpoint, method, Json.serialize(body));
    }

    private static HttpRequest createRequest(final String endpoint, final String method, final String body) {
        HttpRequest request = new HttpRequest();
        
        request.setEndpoint(endpoint);
        request.setMethod(method);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        if (!String.isBlank(body)) {
            request.setBody(body);
        }

        return request;
    }

    private static Map<String, Object> convertResponse(HttpResponse response) {
        return new Map<String, Object>{ 
            'status' => response.getStatusCode(), 
            'body' => response.getBody()
        };
    }
}

// String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
// String method = 'GET';
// Map<String, Object> result = BasicHttpIntegration.send(endpoint, method, '');
// System.debug(result);

// String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
// String method = 'POST';
// String body = '{"name":"mighty moose"}';
// Map<String, Object> result = BasicHttpIntegration.send(endpoint, method, body);
// System.debug(result);

// String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
// String method = 'POST';
// Map<String, object> body = new Map<String, object>{ 'name' => 'mighty moose' };
// Map<String, Object> result = BasicHttpIntegration.send(endpoint, method, body);
// System.debug(result);