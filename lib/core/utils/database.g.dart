// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Language, int> language =
      GeneratedColumn<int>(
        'language',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<Language>($AppSettingsTable.$converterlanguage);
  @override
  late final GeneratedColumnWithTypeConverter<ThemeMode, int> themeMode =
      GeneratedColumn<int>(
        'theme_mode',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      ).withConverter<ThemeMode>($AppSettingsTable.$converterthemeMode);
  static const VerificationMeta _passOnboardingMeta = const VerificationMeta(
    'passOnboarding',
  );
  @override
  late final GeneratedColumn<bool> passOnboarding = GeneratedColumn<bool>(
    'pass_onboarding',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("pass_onboarding" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    language,
    themeMode,
    passOnboarding,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('pass_onboarding')) {
      context.handle(
        _passOnboardingMeta,
        passOnboarding.isAcceptableOrUnknown(
          data['pass_onboarding']!,
          _passOnboardingMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      language: $AppSettingsTable.$converterlanguage.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}language'],
        )!,
      ),
      themeMode: $AppSettingsTable.$converterthemeMode.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}theme_mode'],
        )!,
      ),
      passOnboarding: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}pass_onboarding'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Language, int, int> $converterlanguage =
      const EnumIndexConverter<Language>(Language.values);
  static JsonTypeConverter2<ThemeMode, int, int> $converterthemeMode =
      const EnumIndexConverter<ThemeMode>(ThemeMode.values);
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final int id;
  final Language language;
  final ThemeMode themeMode;
  final bool passOnboarding;
  const AppSetting({
    required this.id,
    required this.language,
    required this.themeMode,
    required this.passOnboarding,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['language'] = Variable<int>(
        $AppSettingsTable.$converterlanguage.toSql(language),
      );
    }
    {
      map['theme_mode'] = Variable<int>(
        $AppSettingsTable.$converterthemeMode.toSql(themeMode),
      );
    }
    map['pass_onboarding'] = Variable<bool>(passOnboarding);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      id: Value(id),
      language: Value(language),
      themeMode: Value(themeMode),
      passOnboarding: Value(passOnboarding),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      id: serializer.fromJson<int>(json['id']),
      language: $AppSettingsTable.$converterlanguage.fromJson(
        serializer.fromJson<int>(json['language']),
      ),
      themeMode: $AppSettingsTable.$converterthemeMode.fromJson(
        serializer.fromJson<int>(json['themeMode']),
      ),
      passOnboarding: serializer.fromJson<bool>(json['passOnboarding']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'language': serializer.toJson<int>(
        $AppSettingsTable.$converterlanguage.toJson(language),
      ),
      'themeMode': serializer.toJson<int>(
        $AppSettingsTable.$converterthemeMode.toJson(themeMode),
      ),
      'passOnboarding': serializer.toJson<bool>(passOnboarding),
    };
  }

  AppSetting copyWith({
    int? id,
    Language? language,
    ThemeMode? themeMode,
    bool? passOnboarding,
  }) => AppSetting(
    id: id ?? this.id,
    language: language ?? this.language,
    themeMode: themeMode ?? this.themeMode,
    passOnboarding: passOnboarding ?? this.passOnboarding,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      id: data.id.present ? data.id.value : this.id,
      language: data.language.present ? data.language.value : this.language,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
      passOnboarding: data.passOnboarding.present
          ? data.passOnboarding.value
          : this.passOnboarding,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('id: $id, ')
          ..write('language: $language, ')
          ..write('themeMode: $themeMode, ')
          ..write('passOnboarding: $passOnboarding')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, language, themeMode, passOnboarding);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.id == this.id &&
          other.language == this.language &&
          other.themeMode == this.themeMode &&
          other.passOnboarding == this.passOnboarding);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<int> id;
  final Value<Language> language;
  final Value<ThemeMode> themeMode;
  final Value<bool> passOnboarding;
  const AppSettingsCompanion({
    this.id = const Value.absent(),
    this.language = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.passOnboarding = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    this.id = const Value.absent(),
    this.language = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.passOnboarding = const Value.absent(),
  });
  static Insertable<AppSetting> custom({
    Expression<int>? id,
    Expression<int>? language,
    Expression<int>? themeMode,
    Expression<bool>? passOnboarding,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (language != null) 'language': language,
      if (themeMode != null) 'theme_mode': themeMode,
      if (passOnboarding != null) 'pass_onboarding': passOnboarding,
    });
  }

  AppSettingsCompanion copyWith({
    Value<int>? id,
    Value<Language>? language,
    Value<ThemeMode>? themeMode,
    Value<bool>? passOnboarding,
  }) {
    return AppSettingsCompanion(
      id: id ?? this.id,
      language: language ?? this.language,
      themeMode: themeMode ?? this.themeMode,
      passOnboarding: passOnboarding ?? this.passOnboarding,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (language.present) {
      map['language'] = Variable<int>(
        $AppSettingsTable.$converterlanguage.toSql(language.value),
      );
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<int>(
        $AppSettingsTable.$converterthemeMode.toSql(themeMode.value),
      );
    }
    if (passOnboarding.present) {
      map['pass_onboarding'] = Variable<bool>(passOnboarding.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('id: $id, ')
          ..write('language: $language, ')
          ..write('themeMode: $themeMode, ')
          ..write('passOnboarding: $passOnboarding')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [appSettings];
}

typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<Language> language,
      Value<ThemeMode> themeMode,
      Value<bool> passOnboarding,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<int> id,
      Value<Language> language,
      Value<ThemeMode> themeMode,
      Value<bool> passOnboarding,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Language, Language, int> get language =>
      $composableBuilder(
        column: $table.language,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<ThemeMode, ThemeMode, int> get themeMode =>
      $composableBuilder(
        column: $table.themeMode,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<bool> get passOnboarding => $composableBuilder(
    column: $table.passOnboarding,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get language => $composableBuilder(
    column: $table.language,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get themeMode => $composableBuilder(
    column: $table.themeMode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get passOnboarding => $composableBuilder(
    column: $table.passOnboarding,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Language, int> get language =>
      $composableBuilder(column: $table.language, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ThemeMode, int> get themeMode =>
      $composableBuilder(column: $table.themeMode, builder: (column) => column);

  GeneratedColumn<bool> get passOnboarding => $composableBuilder(
    column: $table.passOnboarding,
    builder: (column) => column,
  );
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<Language> language = const Value.absent(),
                Value<ThemeMode> themeMode = const Value.absent(),
                Value<bool> passOnboarding = const Value.absent(),
              }) => AppSettingsCompanion(
                id: id,
                language: language,
                themeMode: themeMode,
                passOnboarding: passOnboarding,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<Language> language = const Value.absent(),
                Value<ThemeMode> themeMode = const Value.absent(),
                Value<bool> passOnboarding = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                id: id,
                language: language,
                themeMode: themeMode,
                passOnboarding: passOnboarding,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
