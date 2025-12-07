public with sharing class BasicHttpDemo {

    public static Map<String, object> postMightyMoose() {
        String endpoint = 'https://th-apex-http-callout.herokuapp.com/animals';
        String method = 'POST';

        BodyClass body = new BodyClass();
        body.name = 'mighty moose';

        return BasicHttpIntegration.send(endpoint, method, body);      
    }

    private class BodyClass {
        public String name;
        public String animal;
    }
}