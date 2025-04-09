public with sharing class ParkLocator {
    public List<String> country(String input) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        return parks.byCountry(input);
    }
}