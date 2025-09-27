import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/base_usecase.dart';
import 'package:helper/core/errors/failures.dart';
import 'package:helper/features/splash/domain/repositories/splash_repo.dart';
import 'package:injectable/injectable.dart';

/// a use case that returns the saved theme mode
@lazySingleton
class GetSavedThemeModeUseCase implements BaseUseCase<ThemeMode, NoParameters> {
  /// constructor for the use case that takes a [splashRepo]
  GetSavedThemeModeUseCase({required this.splashRepo});

  /// a [splashRepo] instance to be used in the use case
  final SplashRepo splashRepo;

  @override
  Future<Either<Failure, ThemeMode>> call(NoParameters params) =>
      splashRepo.getSavedThemeMode();
}
