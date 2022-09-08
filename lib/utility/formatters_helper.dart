import 'package:intl/intl.dart';

class Formatters {
  static String weekdayFrom(int unixTime) {
    final date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return DateFormat.EEEE('ru').format(date);
  }

  static String currentDate(int unixTime) {
    final date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return DateFormat('d MMMM y', 'ru').format(date);
  }

  static String sunset(int unixTime) {
    final date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return DateFormat.Hm('ru').format(date);
  }

  static String sunrise(int unixTime) {
    final date = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    return DateFormat.Hm('ru').format(date);
  }
}
