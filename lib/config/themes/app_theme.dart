import 'package:flutter/material.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/app_strings.dart';
import 'package:helper/core/utils/font_size_helper.dart';
import 'package:helper/core/utils/styles_helper.dart';
import 'package:sizer/sizer.dart';

/// A class that provides a light theme configuration for the application.
class AppTheme {
  /// Returns a [ThemeData] object representing the light theme of the app.
  ///
  /// The `lang` argument specifies the language for which the font family
  /// should be selected.
  ///
  /// The returned theme has its various properties configured, such as
  /// text styles, colors, etc.
  static ThemeData theme(String lang) {
    return ThemeData(
      /// useMaterial3.
      useMaterial3: true,
      // Define the primary color swatch.
      primarySwatch: AppColors.primarySwatchColor,

      // Select the font family based on the language setting.
      fontFamily: lang == AppStrings.arabicCode
          ? AppStrings.arabicFontFamily
          : AppStrings.englishFontFamily,

      textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppColors.disabledPrimary,
        selectionHandleColor: AppColors.text,
        cursorColor: AppColors.text,
      ),

      // Various color configurations.
      primaryColor: AppColors.primary,
      hintColor: AppColors.text.withOpacity(0.5),
      disabledColor: AppColors.disabledPrimary,
      dividerColor: AppColors.text,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      shadowColor: Colors.transparent,
      secondaryHeaderColor: AppColors.white,
      cardColor: AppColors.white,
      scaffoldBackgroundColor: AppColors.background,

      /// Set the button theme.
      buttonTheme: const ButtonThemeData(
        buttonColor: AppColors.primary,
        focusColor: AppColors.primary,
      ),

      // Set the brightness level.
      brightness: Brightness.light,

      // // Configure the AppBar theme.
      // appBarTheme: const AppBarTheme(
      //   titleTextStyle: TextStyle(
      //     color: AppColors.text,
      //   ),
      //   centerTitle: false,
      //   color: AppColors.background,
      // ),

      // Define text styles for different use-cases.
      textTheme: TextTheme(
        /// Used for labels on upgrader components.
        labelLarge: getBoldStyle(),

        /// Used for text fields labels.
        labelMedium: getMediumStyle(fontSize: FontSizeHelper.s10),

        /// Used for seen and requested texts.
        labelSmall: getSemiBoldStyle(fontSize: FontSizeHelper.s9),

        /// Used for main headers.
        displayLarge: getSemiBoldStyle(fontSize: FontSizeHelper.s27),

        /// Used for sub-headers and home information and hints.
        /// Use it also for messages but with FontWeight.w500
        displayMedium: getRegularStyle(fontSize: FontSizeHelper.s12),

        /// Used for sub-action text.
        displaySmall: getMediumStyle(),

        /// Used for prominent titles and big circle avatar names.
        /// If you need to use it for the smaller avatar make it 17.sp
        titleLarge: getSemiBoldStyle(fontSize: FontSizeHelper.s22),

        /// Used for subtitles and buttons titles.
        titleMedium: getSemiBoldStyle(),

        /// Used for less prominent titles and online status container.
        titleSmall: getSemiBoldStyle(fontSize: FontSizeHelper.s7),

        /// Used for information text.
        headlineLarge: getRegularStyle(),

        /// Used for navigation bar titles and preferences containers.
        headlineMedium: getMediumStyle(fontSize: FontSizeHelper.s11),

        /// Used for secondary body text.
        headlineSmall: getRegularStyle(fontSize: FontSizeHelper.s11),

        /// Used for bold text.
        bodyLarge: getBoldStyle(),

        /// Used for standard body text.
        bodyMedium: getRegularStyle(fontSize: FontSizeHelper.s10),

        /// Used for smaller body text.
        /// Use it also for last seen message but with FontWeight.w500
        bodySmall: getRegularStyle(fontSize: FontSizeHelper.s9),
      ),

      // dropdownMenuTheme: DropdownMenuThemeData(
      //   inputDecorationTheme: InputDecorationTheme(
      //     filled: true,
      //     hintStyle: TextStyle(
      //       fontSize: 13.sp,
      //       fontWeight: FontWeight.w700,
      //     ),
      //     contentPadding: EdgeInsets.symmetric(
      //       vertical: 1.8.h,
      //       horizontal: 4.w,
      //     ),
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //     enabledBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(8),
      //       borderSide: const BorderSide(
      //         color: AppColors.normalBorder,
      //       ),
      //     ),
      //     errorBorder: const OutlineInputBorder(
      //       borderSide: BorderSide(color: AppColors.error),
      //       borderRadius: BorderRadius.all(Radius.circular(6)),
      //     ),
      //     errorStyle: getRegularStyle(
      //       fontSize: FontSizeHelper.s10,
      //       color: AppColors.error,
      //     ),
      //     focusedBorder: OutlineInputBorder(
      //       borderRadius: BorderRadius.circular(8),
      //       borderSide: const BorderSide(color: AppColors.normalBorder),
      //     ),
      //     focusedErrorBorder: const OutlineInputBorder(
      //       borderSide: BorderSide(color: AppColors.normalBorder),
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(6),
      //       ),
      //     ),
      //     // Add any other properties that you want to customize
      //   ),
      // ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.text.withOpacity(0.9),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.8.h,
          horizontal: 4.w,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          // borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.normalBorder,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.error),
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        errorStyle: getRegularStyle(
          fontSize: FontSizeHelper.s10,
          color: AppColors.error,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.normalBorder),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.normalBorder),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
      ),
    );
  }
}
