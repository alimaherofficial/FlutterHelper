import 'package:dartz/dartz.dart';
import 'package:helper/core/errors/failures.dart';
import 'package:helper/features/Splash/data/datasources/splash_local_datasource.dart';
import 'package:helper/features/Splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// LangRepoImpl is the implementation of [SplashRepo]
@LazySingleton(as: SplashRepo)
class SplashRepoImpl implements SplashRepo {
  /// Constructor
  SplashRepoImpl({
    required this.splashLocalDataSource,
  });

  /// a [splashLocalDataSource] object
  final SplashLocalDataSource splashLocalDataSource;

  @override
  Future<Either<Failure, bool>> changeLang({required String langCode}) async {
    try {
      final langIsChanged =
          await splashLocalDataSource.changeLang(langCode: langCode);
      return Right(langIsChanged);
    } catch (e) {
      return const Left(NormalFailure(''));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedLang() async {
    try {
      final langCode = await splashLocalDataSource.getSavedLang();
      return Right(langCode);
    } catch (e) {
      return const Left(NormalFailure('CacheFailure'));
    }
  }

  @override
  Future<Either<Failure, bool>> changeThemeMode({
    required String themeMode,
  }) async {
    try {
      final themeModeIsChanged =
          await splashLocalDataSource.changeThemeMode(themeMode: themeMode);
      return Right(themeModeIsChanged);
    } catch (e) {
      return const Left(NormalFailure('CacheFailure'));
    }
  }

  @override
  Future<Either<Failure, String>> getSavedThemeMode() async {
    try {
      final themeMode = await splashLocalDataSource.getSavedThemeMode();
      return Right(themeMode);
    } catch (e) {
      return const Left(NormalFailure('CacheFailure'));
    }
  }
}
