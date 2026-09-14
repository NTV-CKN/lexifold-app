abstract class ConvertHelper {
  static String dateTimeToStrIso8601(DateTime date) {
    return date.toUtc().toIso8601String();
  }
}
