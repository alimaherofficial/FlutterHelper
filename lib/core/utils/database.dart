import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

enum Language {
  en,
  ar,
}

class AppSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get language => intEnum<Language>().withDefault(const Constant(0))();
  IntColumn get themeMode => intEnum<ThemeMode>().withDefault(const Constant(0))();
  BoolColumn get passOnboarding => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [AppSettings])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'rytask_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationDocumentsDirectory,
      ),
    );
  }
}