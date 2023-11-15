import 'package:flutter/material.dart';
import 'package:zawj/config/routes/app_routes.dart';
import 'package:zawj/features/Splash/presentation/pages/splash_view.dart';

/// Application routes
class AppRoutes {
  /// this method is used to generate the routes
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashView();
          },
          settings: const RouteSettings(name: Routes.initialRoute),
        );

      default:
        return undefinedRoute();
    }
  }

  /// this method is used to undefinedRoute the routes
  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('undefinedRoute'),
        ),
      ),
      settings: const RouteSettings(name: 'undefinedRoute'),
    );
  }
}
