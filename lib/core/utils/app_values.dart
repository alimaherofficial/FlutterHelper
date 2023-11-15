import 'package:sizer/sizer.dart';

/// this class is the app static values
class AppValues {
  /// the app bar height
  static double appBarHeight = 6.h;

  /// the google api key to use in Google Maps in Addresses
  static String googleApiKey = '';

  /// the app is in test mode or not
  static late bool isTest;

  /// the calculator web page
  /// we get it from the MainCubit method "getRemoteConfigValues()"
  static String priceCalculatorUrl = '';
}
