function date() {
    var SimpleDateFormat = Java.type('java.text.SimpleDateFormat');
    var sdf = new SimpleDateFormat('dd/MM/yyyy');
    var date = new java.util.Date();
    return sdf.format(date);
} 