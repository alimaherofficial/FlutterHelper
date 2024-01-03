// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helper/core/injection_container.dart';
import 'package:helper/features/Splash/domain/usecases/change_lang.dart';
import 'package:helper/features/Splash/domain/usecases/change_theme_mode.dart';
import 'package:helper/features/Splash/domain/usecases/get_saved_lang.dart';
import 'package:helper/features/Splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:helper/features/Splash/presentation/cubit/main/main_cubit.dart';
import 'package:provider/single_child_widget.dart';

/// this class is used to manage the multi bloc provider and multi bloc listener
class MultiBlocManager {
  // ignore: public_member_api_docs
  static List<SingleChildWidget> multiBlocProviderList = [
    BlocProvider(
      create: (context) => MainCubit(
        getIt<GetSavedLangUseCase>(),
        getIt<ChangeLangUseCase>(),
        getIt<GetSavedThemeModeUseCase>(),
        getIt<ChangeThemeModeUseCase>(),
      )
        ..getSavedLang()
        ..getSavedThemeMode(),
    ),
  ];

  /// this method is used to get the multi bloc listener list
  static List<SingleChildWidget> get multiBlocListenersList {
    return [
      // main cubit listener
      BlocListener<MainCubit, MainState>(
        listener: (context, state) {},
      ),
    ];
  }
}
