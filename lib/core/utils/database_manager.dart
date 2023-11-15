// ignore_for_file: public_member_api_docs

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:injectable/injectable.dart';
import 'package:zawj/core/utils/app_strings.dart';

enum DataBoxes {
  auth,
  settings,
  lastAnnouncementID,
  screenshots,
}

/// this class is used to manage the local database
@lazySingleton
class DatabaseManager {
  /// Documents directory for saving our database
  static Directory? documentsDirectory;

  /// Initialize [Hive]
  static Future<dynamic> initHive() async {
    await Hive.initFlutter();
    await Future.wait([
      Hive.openBox<dynamic>(DataBoxes.settings.name),
      Hive.openBox<dynamic>(DataBoxes.lastAnnouncementID.name),
      initScreenShotsEntityAdapter(),
      initAuthEntityAdapter(),
    ]);
  }

  /// set the preferred language code in the database
  void setLanguage(String languageCode) {
    Hive.box<dynamic>(DataBoxes.settings.name).put('language', languageCode);
  }

  /// get the preferred language code from the database
  Future<String> getLanguage() async {
    final box = Hive.box<dynamic>(DataBoxes.settings.name);
    final langCode = box.get('language');
    return Future.value(
      (langCode as String?) == null ? AppStrings.englishCode : langCode,
    );
  }

  /// set the preferred theme mode in the database
  void setThemeMode(String themeMode) {
    Hive.box<dynamic>(DataBoxes.settings.name).put('themeMode', themeMode);
  }

  /// get the preferred theme mode from the database
  Future<String> getThemeMode() async {
    final box = Hive.box<dynamic>(DataBoxes.settings.name);
    final themeMode = box.get('themeMode');
    return Future.value(
      (themeMode as String?) == null ? ThemeMode.system.name : themeMode,
    );
  }

  /// set that the user has seen the onboarding screen
  void get setOnBoarding {
    Hive.box<dynamic>(DataBoxes.settings.name).put('onboardingShowed', true);
  }

  /// get that the user has seen the onBoarding screen
  Future<bool> get getOnBoarding async {
    final box = Hive.box<dynamic>(DataBoxes.settings.name);
    final isOnBoarding = (box.get('onboardingShowed') ?? false) as bool;
    return Future.value(isOnBoarding);
  }

  /// this method is used for debugging only
  /// it will clear all the data in the database
  static Future<void> clearData() async {
    await Hive.box<dynamic>(DataBoxes.settings.name).clear();
    await Hive.box<dynamic>(DataBoxes.settings.name)
        .put('onboardingShowed', true);
    await Hive.box<dynamic>(DataBoxes.lastAnnouncementID.name).clear();
    // await Hive.box<ScreenShotsEntity>(DataBoxes.screenshots.name).clear();
    // await Hive.box<LoginEntity>(DataBoxes.auth.name).clear();
  }

  /// register ScreenShotsEntityAdapter and open the box
  static Future<void> initScreenShotsEntityAdapter() async {
    // Hive.registerAdapter(ScreenShotsEntityAdapter());
    // await Hive.openBox<ScreenShotsEntity>(DataBoxes.screenshots.name);
  }

  /// register ScreenShotsEntityAdapter and open the box
  static Future<void> initAuthEntityAdapter() async {
    // Hive.registerAdapter(LoginEntityAdapter());
    // await Hive.openBox<LoginEntity>(DataBoxes.auth.name);
  }
}
