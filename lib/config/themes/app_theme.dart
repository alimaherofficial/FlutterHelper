// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:zawj/core/utils/app_colors.dart';
import 'package:zawj/core/utils/app_strings.dart';

/// this class is used to manage the app theme
class ThemeHelper {
  /// get the current theme mode
  static bool isDarkTheme(BuildContext context) {
    // if (MainCubit.get(context).currentThemeMode == ThemeMode.system) {
    //   return MediaQuery.of(context).platformBrightness == Brightness.dark;
    // }
    // return MainCubit.get(context).currentThemeMode == ThemeMode.dark;
    return false;
  }

  static AppColors appColors = AppColors();

  /// change the system ui overlay style
  static void changeSystemUiOverlayStyle(BuildContext context) {
    if (isDarkTheme(context)) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: appColors.woodSmoke,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  /// the app theme data
  static ThemeData appThemeWhite(String lang) {
    return ThemeData(
      primarySwatch: AppColors.primarySwatchColor,
      fontFamily: lang == AppStrings.arabicCode
          ? AppStrings.arabicFontFamily
          : AppStrings.englishFontFamily,

      /// [primaryColor] the same in light and dark mode
      primaryColor: AppColors.lipstickRed,

      /// [dividerColor] is used white in dark mode
      dividerColor: appColors.woodSmoke,

      /// [hintColor] is used white with opacity 0.5 in dark mode
      hintColor: appColors.woodSmoke.withOpacity(0.5),

      /// [brightness] is used to change the status bar color
      brightness: Brightness.light,

      /// [splashColor] the same in light and dark mode
      splashColor: appColors.woodSmoke,

      /// [hoverColor] the same in light and dark mode
      hoverColor: AppColors.greenWhite,

      /// [cardColor] is used dark Grey in dark mode
      cardColor: AppColors.grey,

      /// [shadowColor] is used wood white in dark mode
      shadowColor: appColors.woodSmoke,

      /// [scaffoldBackgroundColor] is used woodSmoke in dark mode
      scaffoldBackgroundColor: appColors.white,

      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          /// [color] is used woodSmoke in dark mode
          color: AppColors.greenWhite,
        ),
        centerTitle: true,

        /// [color] is used greenWhite in dark mode
        color: appColors.woodSmoke,
      ),
      textTheme: TextTheme(
        /// Display Huge = 130
        headlineLarge: TextStyle(
          fontSize: 126.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Label Large For Upgrader
        labelLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Label Medium For Marquee
        labelMedium: TextStyle(
          fontSize: 108.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Display Large = 32
        displayLarge: TextStyle(
          fontSize: 29.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Display Medium = 24
        displayMedium: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Display Small = 18
        displaySmall: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Large = 18
        titleLarge: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Medium = 16
        titleMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Small = 14 (Default)
        titleSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Body Large = 16
        bodyLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        // Body Regular = 16
        headlineMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Body Semi = 14
        headlineSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Body Medium = 14
        bodyMedium: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),

        /// Body Small = 12
        bodySmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  /// the app theme data for dark mode
  static ThemeData appThemeDark(String lang) {
    return ThemeData(
      primarySwatch: AppColors.primarySwatchColor,
      fontFamily: lang == AppStrings.arabicCode
          ? AppStrings.arabicFontFamily
          : AppStrings.englishFontFamily,
      primaryColor: AppColors.lipstickRed,
      dividerColor: appColors.white,
      hintColor: appColors.white.withOpacity(0.5),
      brightness: Brightness.dark,
      splashColor: appColors.woodSmoke,
      hoverColor: AppColors.greenWhite,
      cardColor: AppColors.darkGrey,
      scaffoldBackgroundColor: appColors.woodSmoke,
      shadowColor: appColors.white,
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
          color: appColors.woodSmoke,
        ),
        centerTitle: true,
        color: AppColors.greenWhite,
      ),
      textTheme: TextTheme(
        /// Display Huge = 130
        headlineLarge: TextStyle(
          fontSize: 126.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Label Large For Upgrader
        labelLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Label Medium For Marquee
        labelMedium: TextStyle(
          fontSize: 108.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Display Large = 32
        displayLarge: TextStyle(
          fontSize: 29.sp,
          fontWeight: FontWeight.w700,
        ),

        /// Display Medium = 24
        displayMedium: TextStyle(
          fontSize: 21.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Display Small = 18
        displaySmall: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Large = 18
        titleLarge: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Medium = 16
        titleMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Title Small = 14 (Default)
        titleSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
        ),

        /// Body Large = 16
        bodyLarge: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
        ),

        // Body Regular = 16
        headlineMedium: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Body Semi = 14
        headlineSmall: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),

        /// Body Medium = 14
        bodyMedium: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
        ),

        /// Body Small = 12
        bodySmall: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
