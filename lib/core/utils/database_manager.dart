import 'package:flutter/material.dart';
import 'package:helper/core/utils/database.dart';
import 'package:helper/main.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';

/// this class is used to manage the local database
@lazySingleton
class DatabaseManager {
  /// Initialize Drift database
  static Future<AppDatabase> initDatabase() async {
    final db = AppDatabase();

    // Initialize with default settings if none exist
    final existing = await db.select(db.appSettings).getSingleOrNull();
    if (existing == null) {
      await db.into(db.appSettings).insert(
            AppSettingsCompanion.insert(
              language: const Value(Language.en),
              themeMode: const Value(ThemeMode.system),
              passOnboarding: const Value(false),
            ),
          );
    }

    return db;
  }

  /// set the preferred language code in the database
  Future<void> setLanguage(Language language) async {
    final existing = await database.select(database.appSettings).getSingle();
    await (database.update(database.appSettings)
          ..where((tbl) => tbl.id.equals(existing.id)))
        .write(AppSettingsCompanion(language: Value(language)));
  }

  /// get the preferred language code from the database
  Future<Language> getLanguage() async {
    final appSettings = await database.select(database.appSettings).getSingle();
    return appSettings.language;
  }

  /// set the preferred theme mode in the database
  Future<void> setThemeMode(ThemeMode themeMode) async {
    final existing = await database.select(database.appSettings).getSingle();
    await (database.update(database.appSettings)
          ..where((tbl) => tbl.id.equals(existing.id)))
        .write(AppSettingsCompanion(themeMode: Value(themeMode)));
  }

  /// get the preferred theme mode from the database
  Future<ThemeMode> getThemeMode() async {
    final appSettings = await database.select(database.appSettings).getSingle();
    return appSettings.themeMode;
  }

  /// set that the user has seen the onboarding screen
  Future<void> get setOnBoarding async {
    final existing = await database.select(database.appSettings).getSingle();
    await (database.update(database.appSettings)
          ..where((tbl) => tbl.id.equals(existing.id)))
        .write(const AppSettingsCompanion(passOnboarding: Value(true)));
  }

  /// get that the user has seen the onBoarding screen
  Future<bool> get getOnBoarding async {
    final appSettings = await database.select(database.appSettings).getSingle();
    return appSettings.passOnboarding;
  }

  /// this method is used for debugging only
  /// it will clear all the data in the database
  static Future<void> clearData() async {
    await database.delete(database.appSettings).go();
  }
}
