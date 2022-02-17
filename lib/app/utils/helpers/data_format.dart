import 'package:intl/intl.dart';

String dateFormat(String date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

  var outputFormat = DateFormat('dd MMM yyyy');
  var outputDate = outputFormat.format(inputDate);

  return outputDate;
}

String dateFormatHistoryRedeem(String date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(date); // <-- dd/MM 24H format

  var outputFormat = DateFormat('dd/MM/yy');
  var outputDate = outputFormat.format(inputDate);

  return outputDate;
}
