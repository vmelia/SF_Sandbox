public with sharing class AnimalLocator {
    public class Animal {
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }

    public class AnimalResult {
        public Animal animal;
    }

    public static String getAnimalNameById(Integer id)
    {
       Http http = new Http();
       HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
         request.setMethod('GET');
         HttpResponse response = http.send(request);
           String strResp = '';
            system.debug('******response '+response.getStatusCode());
            system.debug('******response '+response.getBody());
         // If the request is successful, parse the JSON response.
 
         if (response.getStatusCode() == 200) 
         {
             // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
             // Cast the values in the 'animals' key as a list
            Map<string,object> animals = (map<string,object>) results.get('animal');
             System.debug('Received the following animals:' + animals );
             strResp = string.valueof(animals.get('name'));
             System.debug('strResp >>>>>>' + strResp );
         }
 
         return strResp ;
    }
}