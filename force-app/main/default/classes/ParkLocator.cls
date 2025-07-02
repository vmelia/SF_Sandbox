public class ParkLocator {
    public static List<String> Country(String name) {
        List<String> countries = new List<String>();
         ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        countries = park.byCountry(name);
        return countries;
    }
}