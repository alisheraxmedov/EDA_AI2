import 'package:intl/intl.dart';

String keyGenerateFunction() {
  
  DateTime now = DateTime.now();

  final DateFormat formatter = DateFormat('MMMMddyyyy');

  return formatter.format(now);
}
