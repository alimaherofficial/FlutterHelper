// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/Splash/data/datasources/splash_local_datasource.dart'
    as _i832;
import '../features/Splash/data/repositories/splash_repo_impl.dart' as _i975;
import '../features/Splash/domain/repositories/splash_repo.dart' as _i852;
import '../features/Splash/domain/usecases/change_lang.dart' as _i526;
import '../features/Splash/domain/usecases/change_theme_mode.dart' as _i605;
import '../features/Splash/domain/usecases/get_saved_lang.dart' as _i223;
import '../features/Splash/domain/usecases/get_saved_theme_mode.dart' as _i193;
import 'utils/database_manager.dart' as _i273;
import 'utils/deep_linking_helper.dart' as _i325;
import 'utils/supabase_helper.dart' as _i483;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i325.DeepLinkingHelper>(() => _i325.DeepLinkingHelper());
    gh.lazySingleton<_i483.SupaBaseHelper>(() => _i483.SupaBaseHelper());
    gh.lazySingleton<_i273.DatabaseManager>(() => _i273.DatabaseManager());
    gh.lazySingleton<_i832.SplashLocalDataSource>(
        () => _i832.SplashLocalDataSourceImpl());
    gh.lazySingleton<_i852.SplashRepo>(() => _i975.SplashRepoImpl(
        splashLocalDataSource: gh<_i832.SplashLocalDataSource>()));
    gh.lazySingleton<_i223.GetSavedLangUseCase>(
        () => _i223.GetSavedLangUseCase(splashRepo: gh<_i852.SplashRepo>()));
    gh.lazySingleton<_i193.GetSavedThemeModeUseCase>(() =>
        _i193.GetSavedThemeModeUseCase(splashRepo: gh<_i852.SplashRepo>()));
    gh.lazySingleton<_i526.ChangeLangUseCase>(
        () => _i526.ChangeLangUseCase(splashRepo: gh<_i852.SplashRepo>()));
    gh.lazySingleton<_i605.ChangeThemeModeUseCase>(
        () => _i605.ChangeThemeModeUseCase(splashRepo: gh<_i852.SplashRepo>()));
    return this;
  }
}
