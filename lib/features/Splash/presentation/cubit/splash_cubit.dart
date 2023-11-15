import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'splash_state.dart';

/// this cubit is used to manage the splash screen state
class SplashCubit extends Cubit<SplashState> {
  /// constructor
  SplashCubit() : super(SplashInitial());

  /// this method is used to change the splash screen state to [SplashCubit]
  static SplashCubit get(BuildContext context) => BlocProvider.of(context);
}
