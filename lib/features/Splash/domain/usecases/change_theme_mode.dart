import 'package:dartz/dartz.dart';
import 'package:helper/core/base_usecase.dart';
import 'package:helper/core/errors/failures.dart';
import 'package:helper/features/Splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// a use case class that is used to change the theme mode of the app
@lazySingleton
class ChangeThemeModeUseCase implements BaseUseCase< bool, String> {
  /// constructor for the class that takes a [splashRepo] as a parameter
  ChangeThemeModeUseCase({required this.splashRepo});

  /// [splashRepo] instance to be used in the use case
  final SplashRepo splashRepo;

  @override
  Future<Either<Failure, bool>> call(String themeMode) =>
      splashRepo.changeThemeMode(themeMode: themeMode);
}
