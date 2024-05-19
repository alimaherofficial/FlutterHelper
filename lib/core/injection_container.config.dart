// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/Splash/data/datasources/splash_local_datasource.dart'
    as _i4;
import '../features/Splash/data/repositories/splash_repo_impl.dart' as _i6;
import '../features/Splash/domain/repositories/splash_repo.dart' as _i5;
import '../features/Splash/domain/usecases/change_lang.dart' as _i9;
import '../features/Splash/domain/usecases/change_theme_mode.dart' as _i10;
import '../features/Splash/domain/usecases/get_saved_lang.dart' as _i7;
import '../features/Splash/domain/usecases/get_saved_theme_mode.dart' as _i8;
import 'utils/database_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.DatabaseManager>(() => _i3.DatabaseManager());
    gh.lazySingleton<_i4.SplashLocalDataSource>(
        () => _i4.SplashLocalDataSourceImpl());
    gh.lazySingleton<_i5.SplashRepo>(() => _i6.SplashRepoImpl(
        splashLocalDataSource: gh<_i4.SplashLocalDataSource>()));
    gh.lazySingleton<_i7.GetSavedLangUseCase>(
        () => _i7.GetSavedLangUseCase(splashRepo: gh<_i5.SplashRepo>()));
    gh.lazySingleton<_i8.GetSavedThemeModeUseCase>(
        () => _i8.GetSavedThemeModeUseCase(splashRepo: gh<_i5.SplashRepo>()));
    gh.lazySingleton<_i9.ChangeLangUseCase>(
        () => _i9.ChangeLangUseCase(splashRepo: gh<_i5.SplashRepo>()));
    gh.lazySingleton<_i10.ChangeThemeModeUseCase>(
        () => _i10.ChangeThemeModeUseCase(splashRepo: gh<_i5.SplashRepo>()));
    return this;
  }
}
