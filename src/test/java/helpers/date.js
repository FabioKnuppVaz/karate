() => {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat('dd/MM/yyyy');
    sdf.setTimeZone(TimeZone.getTimeZone('Brazil/East'));
    var date = new java.util.Date();
    return sdf.format(date);
}