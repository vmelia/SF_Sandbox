public with sharing class MyIterable implements Iterable<String>{
    public MyIterable(List<String> strings) {
        this.strings = strings;
    }

    private List<String> strings;

    public Iterator<String> iterator() {
        return strings.iterator();
    }
}