import 'package:helper/core/utils/app_strings.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

/// this class is used to manage the locale
class LocaleHelper {
  /// checks if the current locale is arabic
  static bool get isArabic => Intl.getCurrentLocale() == AppStrings.arabicCode;
}
