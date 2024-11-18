public with sharing class DateFormatter {
    DateHelper helper;
    public DateFormatter(DateHelper helper){
        this.helper = helper;
    }

    public String getFormattedDate() {
        return helper.today().format();
    } 
}