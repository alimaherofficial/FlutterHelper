import 'package:flutter/material.dart';
import 'package:helper/core/injection_container.dart';
import 'package:helper/core/utils/database.dart';
import 'package:helper/core/utils/database_manager.dart';
import 'package:injectable/injectable.dart';

/// this class is responsible for saving and getting the language code
abstract interface class SplashLocalDataSource {
  /// saves the language code in the database
  Future<bool> changeLang({required Language langCode});

  /// get the saved language code
  Future<Language> getSavedLang();

  /// saves the theme mode in the local storage
  Future<bool> changeThemeMode({required ThemeMode themeMode});

  /// gets the saved theme mode from the local storage
  Future<ThemeMode> getSavedThemeMode();
}

/// this class is responsible for saving and getting the language code
/// it implements [SplashLocalDataSource]
@LazySingleton(as: SplashLocalDataSource)
class SplashLocalDataSourceImpl implements SplashLocalDataSource {
  /// Constructor
  SplashLocalDataSourceImpl();

  @override
  Future<bool> changeLang({required Language langCode}) async {
    try {
      await getIt<DatabaseManager>().setLanguage(langCode);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Language> getSavedLang() async {
    return getIt<DatabaseManager>().getLanguage();
  }

  @override
  Future<bool> changeThemeMode({required ThemeMode themeMode}) async {
    try {
      await getIt<DatabaseManager>().setThemeMode(themeMode);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ThemeMode> getSavedThemeMode() async {
    final result = await getIt<DatabaseManager>().getThemeMode();
    return result;
  }
}
