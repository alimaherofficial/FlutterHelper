import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

part 'app_settings.g.dart';

/// A class that represents the app settings.
@Collection()
class AppSettings {
  /// The default constructor.
  AppSettings({
    this.language = Language.en,
    this.themeMode = ThemeMode.system,
    this.passOnboarding = false,
  });

  /// The id of the settings
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment

  /// The language of the app
  @enumerated
  Language language;

  /// The theme mode of the app
  @enumerated
  ThemeMode themeMode;

  /// Whether the user has passed the onboarding
  bool passOnboarding;
}

/// The language of the app
enum Language {
  /// English
  en,

  /// Arabic
  ar,
}
