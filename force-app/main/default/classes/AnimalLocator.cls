public class AnimalLocator {
    public static string getAnimalNameById(integer x){
        string  mystring= '';
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + x);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        system.debug('******res '+res.getStatusCode());
        system.debug('******res '+res.getBody());
        
        if (res.getStatusCode() == 200) {
            system.debug('res.getStatusCode'+ res.getStatusCode() + ' ' + res.getStatus());
            Map<String, Object> results = (Map<String, Object>)JSON.deserializeUntyped(res.getBody());
            Map<String, Object> animal = (Map<String, Object>) results.get('animal');
            system.debug('animal ==> '+animal);
            mystring= String.valueOf(animal.get('name'));
            System.debug('mystring >>>>>>' + mystring );
            
        }
        return mystring;
    }
}