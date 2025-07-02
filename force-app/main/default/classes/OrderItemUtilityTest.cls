@isTest
private class OrderItemUtilityTest {

    @isTest
    static void addBonusBouquet_ifOrdersAreActivated_addsAfreeBouquet() {
        List<Order> orders = new List<Order>{
            new Order(Name = 'order-1', Status = 'Draft'),
            new Order(Name = 'order-2', Status = 'Activated'),
            new Order(Name = 'order-3', Status = 'Draft')
        };

        Test.startTest();
        OrderItemUtility.addBonusBouquet(orders);
        Test.stopTest();
    }
}