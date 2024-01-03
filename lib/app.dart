import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helper/config/routes/app_pages.dart';
import 'package:helper/config/themes/app_theme.dart';
import 'package:helper/config/themes/app_theme_dark.dart';
import 'package:helper/core/presentation/widgets/no_glow.dart';
import 'package:helper/core/utils/analytics_navigator_observer.dart';
import 'package:helper/core/utils/app_strings.dart';
import 'package:helper/core/utils/multi_bloc_manager.dart';
import 'package:helper/features/Splash/presentation/cubit/main/main_cubit.dart';
import 'package:helper/generated/l10n.dart';
import 'package:helper/main.dart';
import 'package:sizer/sizer.dart';

/// Main App Widget
class HelperApp extends StatelessWidget {
  /// Constructor
  const HelperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MultiBlocManager.multiBlocProviderList,
      child: MultiBlocListener(
        listeners: MultiBlocManager.multiBlocListenersList,
        child: BlocBuilder<MainCubit, MainState>(
          builder: (context, state) {
            return Sizer(
              builder: (context, orientation, deviceType) => NoGlowScroll(
                child: MaterialApp(
                  navigatorObservers: [AnalyticsNavigatorObserver()],
                  scaffoldMessengerKey: rootScaffoldMessengerKey,
                  navigatorKey: navigatorKey,
                  title: AppStrings.appName,
                  locale: Locale(MainCubit.get(context).currentLangCode),
                  debugShowCheckedModeBanner: false,
                  theme: AppTheme.theme(
                    MainCubit.get(context).currentLangCode,
                  ),
                  darkTheme: AppThemeDark.theme(
                    MainCubit.get(context).currentLangCode,
                  ),
                  themeMode: MainCubit.get(context).currentThemeMode,
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                  supportedLocales: S.delegate.supportedLocales,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
