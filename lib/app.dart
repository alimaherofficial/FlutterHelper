import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helper/config/themes/app_theme.dart';
import 'package:helper/config/themes/app_theme_dark.dart';
import 'package:helper/core/presentation/widgets/no_glow.dart';
import 'package:helper/core/utils/analytics_navigator_observer.dart';
import 'package:helper/core/utils/app_strings.dart';
import 'package:helper/core/utils/app_values.dart';
import 'package:helper/core/utils/multi_bloc_manager.dart';
import 'package:helper/core/utils/size_helper.dart';
import 'package:helper/features/Splash/presentation/cubit/main/main_cubit.dart';
import 'package:helper/generated/l10n.dart';
import 'package:helper/main.dart';

/// Main App Widget
class FrzbiApp extends StatelessWidget {
  /// Constructor
  const FrzbiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocManager.multiBlocProviderList,
      child: MultiBlocListener(
        listeners: MultiBlocManager.multiBlocListenersList,
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                SizeHelper.constraints = constraints;
                return NoGlowScroll(
                  child: MaterialApp.router(
                    title: AppStrings.appName,
                    locale: Locale(MainCubit.get(context).currentLangCode),
                    debugShowCheckedModeBanner: AppValues.isTest,
                    theme: AppTheme.theme(
                      lang: MainCubit.get(context).currentLangCode,
                    ),
                    darkTheme: AppThemeDark.theme(
                      lang: MainCubit.get(context).currentLangCode,
                    ),
                    themeMode: MainCubit.get(context).currentThemeMode,
                    supportedLocales: S.delegate.supportedLocales,
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    routerConfig: appRouter.config(
                      navigatorObservers: () {
                        return [
                          AnalyticsNavigatorObserver(),
                        ];
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
