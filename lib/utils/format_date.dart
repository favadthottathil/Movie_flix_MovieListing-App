import 'package:intl/intl.dart';

formateDate(String dateString) {
  // Parse date string into a DateTime object
  DateTime date = DateFormat('yyyy-MM-dd').parse(dateString);

  // Format DateTime object
  String formattedDate = DateFormat('MMMM dd,yyyy').format(date);

  return formattedDate;
}
