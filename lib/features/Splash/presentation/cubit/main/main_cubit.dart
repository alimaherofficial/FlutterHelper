import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helper/core/base_usecase.dart';
import 'package:helper/core/utils/database.dart';
import 'package:helper/core/utils/theme_helper.dart';
import 'package:helper/features/splash/domain/usecases/change_lang.dart';
import 'package:helper/features/splash/domain/usecases/change_theme_mode.dart';
import 'package:helper/features/splash/domain/usecases/get_saved_lang.dart';
import 'package:helper/features/splash/domain/usecases/get_saved_theme_mode.dart';
import 'package:helper/generated/l10n.dart';

part 'main_state.dart';

/// enum for connectivity status
enum ConnectivityStatus {
  /// connected
  connected,

  /// disconnected
  disconnected,
}

/// a cubit to handle the main functionality of the app
class MainCubit extends Cubit<MainState> {
  /// constructor
  MainCubit(
    this._getSavedLangUseCase,
    this._changeLangUseCase,
    this._getSavedThemeModeUseCase,
    this._changeThemeModeUseCase,
  ) : super(MainInitialState());

  /// a static method to get the cubit instance
  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  final GetSavedLangUseCase _getSavedLangUseCase;
  final ChangeLangUseCase _changeLangUseCase;

  /// the current language code
  Language currentLangCode = Language.en;

  final GetSavedThemeModeUseCase _getSavedThemeModeUseCase;
  final ChangeThemeModeUseCase _changeThemeModeUseCase;

  /// the current theme mode
  ThemeMode currentThemeMode = ThemeMode.dark;

  /// changes the theme mode
  Future<void> changeTheme({
    required ThemeMode themeMode,
    required BuildContext context,
  }) async {
    final response = await _changeThemeModeUseCase.call(themeMode);
    response.fold((failure) => currentThemeMode = ThemeMode.system, (value) {
      if (themeMode == ThemeMode.dark) {
        currentThemeMode = ThemeMode.dark;
      } else if (themeMode == ThemeMode.light) {
        currentThemeMode = ThemeMode.light;
      }
      ThemeHelper.changeSystemUiOverlayStyle(context);

      emit(MainChangeThemeState());
    });
  }

  /// gets the saved theme mode
  Future<void> getSavedThemeMode() async {
    final response = await _getSavedThemeModeUseCase.call(NoParameters());
    response.fold((failure) => currentThemeMode = ThemeMode.system, (value) {
      if (value == ThemeMode.dark) {
        currentThemeMode = ThemeMode.dark;
      } else if (value == ThemeMode.light) {
        currentThemeMode = ThemeMode.light;
      }
      emit(MainGetThemeModeState());
    });
  }

  /// gets the saved language
  Future<void> getSavedLang() async {
    final response = await _getSavedLangUseCase.call(NoParameters());
    response.fold((failure) => currentLangCode = Language.en, (value) {
      currentLangCode = value;
      emit(MainGetLocaleState());
    });
  }

  /// changes the language
  Future<void> changeLang({required Language languageValue}) async {
    final response = await _changeLangUseCase.call(languageValue);
    response.fold(
      (failure) {
        throw Exception(failure.toString());
      },
      (value) {
        currentLangCode = languageValue;
        S.load(Locale(languageValue.name));
        emit(MainChangeLocaleState());
      },
    );
  }
}
