import 'package:intl/intl.dart';

String formatDate(DateTime? date, {String format = "dd MMMM yyyy"}) {
  if (date == null) {
    return "";
  }
  String currDate = DateFormat(format).format(date);
  return currDate;
}

String convertToWIB(String time) {
  try {
    List<String> parts = time.split(':');
    if (parts.length != 3) {
      throw FormatException('Invalid time format');
    }

    String formattedTime = "${parts[0]}:${parts[1]} WIB";
    return formattedTime;
  } catch (e) {
    return 'Invalid input';
  }
}
