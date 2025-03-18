import 'package:intl/intl.dart';

String formatDate(DateTime? date, {String format = "dd MMMM yyyy"}) {
  if (date == null) {
    return "";
  }
  String currDate = DateFormat(format).format(date);
  return currDate;
}
