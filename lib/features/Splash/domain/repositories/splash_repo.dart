import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/errors/failures.dart';
import 'package:helper/core/utils/database.dart';

/// abstract interface class for Splash repository
abstract interface class SplashRepo {
  /// saves the language code
  Future<Either<Failure, bool>> changeLang({required Language langCode});

  /// gets the saved language code
  Future<Either<Failure, Language>> getSavedLang();

  /// saves the theme mode
  Future<Either<Failure, bool>> changeThemeMode({required ThemeMode themeMode});

  /// gets the saved theme mode
  Future<Either<Failure, ThemeMode>> getSavedThemeMode();
}
