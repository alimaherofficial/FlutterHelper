import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helper/core/utils/app_settings.dart';
import 'package:helper/main.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

/// this class is used to manage the local database
@lazySingleton
class DatabaseManager {
  /// Documents directory for saving our database
  static Directory? documentsDirectory;

  /// Initialize [Isar] database
  static Future<Isar> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      // inspector: false,
      [
        AppSettingsSchema,
      ],
      directory: dir.path,
    );
    final result = await isar.appSettings.get(1);
    if (result == null) {
      await isar.writeTxn(
        () async {
          await isar.appSettings.put(AppSettings());
        },
      );
    }

    return isar;
  }

  /// set the preferred language code in the database
  Future<void> setLanguage(Language language) async {
    await isar.writeTxn(
      () async {
        await isar.appSettings.put(AppSettings(language: language));
      },
    );
    return;
  }

  /// get the preferred language code from the database
  Future<Language> getLanguage() async {
    final appSettings = await isar.appSettings.get(1);
    final lang = appSettings!.language;
    return Future.value(lang);
  }

  /// set the preferred theme mode in the database
  Future<void> setThemeMode(ThemeMode themeMode) async {
    await isar.writeTxn(
      () async {
        await isar.appSettings.put(AppSettings(themeMode: themeMode));
      },
    );
    return;
  }

  /// get the preferred theme mode from the database
  Future<ThemeMode> getThemeMode() async {
    final appSettings = await isar.appSettings.get(1);
    final themeMode = appSettings!.themeMode;
    return Future.value(themeMode);
  }

  /// set that the user has seen the onboarding screen
  Future<void> get setOnBoarding async {
    await isar.writeTxn(
      () async {
        await isar.appSettings.put(AppSettings(passOnboarding: true));
      },
    );
  }

  /// get that the user has seen the onBoarding screen
  Future<bool> get getOnBoarding async {
    return Future.value(true);
  }

  /// this method is used for debugging only
  /// it will clear all the data in the database
  static Future<void> clearData() async {
    await isar.appSettings.clear();
    return;
  }
}
