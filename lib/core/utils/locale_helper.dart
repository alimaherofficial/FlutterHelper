import 'package:helper/core/utils/database.dart';
import 'package:intl/intl.dart';

/// this class is used to manage the locale
class LocaleHelper {
  /// checks if the current locale is arabic
  static bool get isArabic => Intl.getCurrentLocale() == Language.ar.name;
}
