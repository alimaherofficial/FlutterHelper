import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/errors/failures.dart';
import 'package:helper/core/utils/database.dart';
import 'package:helper/features/splash/data/datasources/splash_local_datasource.dart';
import 'package:helper/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// LangRepoImpl is the implementation of [SplashRepo]
@LazySingleton(as: SplashRepo)
class SplashRepoImpl implements SplashRepo {
  /// Constructor
  SplashRepoImpl({required this.splashLocalDataSource});

  /// a [splashLocalDataSource] object
  final SplashLocalDataSource splashLocalDataSource;

  @override
  Future<Either<Failure, bool>> changeLang({required Language langCode}) async {
    try {
      final langIsChanged = await splashLocalDataSource.changeLang(
        langCode: langCode,
      );
      return Right(langIsChanged);
    } catch (e) {
      return Left(Failure.fromObject(e));
    }
  }

  @override
  Future<Either<Failure, Language>> getSavedLang() async {
    try {
      final langCode = await splashLocalDataSource.getSavedLang();
      return Right(langCode);
    } catch (e) {
      return Left(Failure.fromObject(e));
    }
  }

  @override
  Future<Either<Failure, bool>> changeThemeMode({
    required ThemeMode themeMode,
  }) async {
    try {
      final themeModeIsChanged = await splashLocalDataSource.changeThemeMode(
        themeMode: themeMode,
      );
      return Right(themeModeIsChanged);
    } catch (e) {
      return Left(Failure.fromObject(e));
    }
  }

  @override
  Future<Either<Failure, ThemeMode>> getSavedThemeMode() async {
    try {
      final themeMode = await splashLocalDataSource.getSavedThemeMode();
      return Right(themeMode);
    } catch (e) {
      return Left(Failure.fromObject(e));
    }
  }
}
