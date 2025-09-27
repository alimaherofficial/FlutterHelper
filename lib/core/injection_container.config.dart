// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../features/splash/data/datasources/splash_local_datasource.dart'
    as _i277;
import '../features/splash/data/repositories/splash_repo_impl.dart' as _i653;
import '../features/splash/domain/repositories/splash_repo.dart' as _i716;
import '../features/splash/domain/usecases/change_lang.dart' as _i318;
import '../features/splash/domain/usecases/change_theme_mode.dart' as _i832;
import '../features/splash/domain/usecases/get_saved_lang.dart' as _i445;
import '../features/splash/domain/usecases/get_saved_theme_mode.dart' as _i880;
import 'utils/database_manager.dart' as _i273;
import 'utils/deep_linking_helper.dart' as _i325;
import 'utils/supabase_helper.dart' as _i483;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i325.DeepLinkingHelper>(() => _i325.DeepLinkingHelper());
    gh.lazySingleton<_i273.DatabaseManager>(() => _i273.DatabaseManager());
    gh.lazySingleton<_i483.SupaBaseHelper>(() => _i483.SupaBaseHelper());
    gh.lazySingleton<_i277.SplashLocalDataSource>(
      () => _i277.SplashLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i716.SplashRepo>(
      () => _i653.SplashRepoImpl(
        splashLocalDataSource: gh<_i277.SplashLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i445.GetSavedLangUseCase>(
      () => _i445.GetSavedLangUseCase(splashRepo: gh<_i716.SplashRepo>()),
    );
    gh.lazySingleton<_i880.GetSavedThemeModeUseCase>(
      () => _i880.GetSavedThemeModeUseCase(splashRepo: gh<_i716.SplashRepo>()),
    );
    gh.lazySingleton<_i318.ChangeLangUseCase>(
      () => _i318.ChangeLangUseCase(splashRepo: gh<_i716.SplashRepo>()),
    );
    gh.lazySingleton<_i832.ChangeThemeModeUseCase>(
      () => _i832.ChangeThemeModeUseCase(splashRepo: gh<_i716.SplashRepo>()),
    );
    return this;
  }
}
