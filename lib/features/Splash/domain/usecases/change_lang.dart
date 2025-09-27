import 'package:dartz/dartz.dart';
import 'package:helper/core/base_usecase.dart';
import 'package:helper/core/errors/failures.dart';
import 'package:helper/core/utils/database.dart';
import 'package:helper/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// a use case that changes the language of the app
@lazySingleton
class ChangeLangUseCase implements BaseUseCase<bool, Language> {
  /// constructor for the use case that takes a [SplashRepo] as a parameter
  ChangeLangUseCase({required this.splashRepo});

  /// a [SplashRepo] instance to be used in the use case
  final SplashRepo splashRepo;

  @override
  Future<Either<Failure, bool>> call(Language langCode) =>
      splashRepo.changeLang(langCode: langCode);
}
