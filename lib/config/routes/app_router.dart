import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:helper/config/routes/app_paths.dart';
import 'package:helper/config/routes/app_router.gr.dart';
import 'package:helper/core/utils/custom_concentric_clipper.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
)

/// AppRouter
class AppRouter extends RootStackRouter {
  @override
  final List<AutoRoute> routes = [
    CustomRoute<dynamic>(
      page: SplashView.page,
      path: AppPaths.splash,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ];

  /// i need to assign navigator key to this router
  /// so i can use it in main.dart
  @override
  GlobalKey<NavigatorState> get navigatorKey => super.navigatorKey;
}

// ignore: unused_element
Widget _customSplashTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  // Define the tween and curve for the custom clipper animation
  final tween = Tween(begin: 0.0, end: 1.0);
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );

  return AnimatedBuilder(
    animation: curvedAnimation,
    builder: (context, child) {
      return ClipPath(
        clipper: CustomConcentricClipper(
          progress: tween.evaluate(curvedAnimation),
          verticalPosition: 0.87,
        ),
        child: child,
      );
    },
    child: child,
  );
}

@RoutePage(name: 'HomeTab')

/// HomeTabScreen
class HomeTabScreen extends AutoRouter {
  /// HomeTabScreen constructor
  const HomeTabScreen({super.key});
}

@RoutePage(name: 'MyTripsTab')

/// MyTripsTabScreen
class MyTripsTabScreen extends AutoRouter {
  /// MyTripsTabScreen constructor
  const MyTripsTabScreen({super.key});
}

@RoutePage(name: 'AccountTab')

/// AccountTabScreen
class AccountTabScreen extends AutoRouter {
  /// AccountTabScreen constructor
  const AccountTabScreen({super.key});
}
