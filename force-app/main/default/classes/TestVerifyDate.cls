@isTest
private class TestVerifyDate{
   @isTest 
   static void checkDates_1_day_apart()
   {
       Date date1 = Date.newInstance(2000, 1, 1);
       Date date2 = Date.newInstance(2000, 1, 2);
         
       Date result = VerifyDate.CheckDates(date1, date2);
          
       System.assertEquals(date2, result);
   }
   
   @isTest 
   static void checkDates_30_days_apart()
   {
       Date date1 = Date.newInstance(2000, 1, 1);
       Date date2 = Date.newInstance(2000, 1, 31);
         
       Date result = VerifyDate.CheckDates(date1, date2);
          
       System.assertEquals(date2, result);
   }
   
   @isTest 
   static void checkDates_31_days_apart()
   {
       Date date1 = Date.newInstance(2000, 1, 1);
       Date date2 = Date.newInstance(2000, 2, 1);
         
       Date result = VerifyDate.CheckDates(date1, date2);
          
       System.assertEquals(Date.newInstance(2000, 1, 31), result);
   }
}