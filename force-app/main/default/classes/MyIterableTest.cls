@isTest
private class MyIterableTest {

    @isTest
    static void testIterableForLoop() {
        List<String> strings = new List<String>{'Hello', 'World'};
        MyIterable myIterable = new MyIterable(strings);
        Integer count = 0;
        for(String str : myIterable) {
            System.debug(str);
            count++
        }

        Assert.areEqual(2, count, 'Expected 2 iterations');
    }
}