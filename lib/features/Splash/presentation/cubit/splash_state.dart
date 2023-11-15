part of 'splash_cubit.dart';

/// this class is used to manage the splash screen state
abstract class SplashState extends Equatable {
  /// constructor
  const SplashState();

  @override
  List<Object> get props => [];
}

/// this class is used to manage the splash screen initial state
class SplashInitial extends SplashState {}
