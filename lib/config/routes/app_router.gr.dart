// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:helper/config/routes/app_router.dart' as _i1;
import 'package:helper/features/Splash/presentation/pages/splash_view.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    AccountTab.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AccountTabScreen(),
      );
    },
    HomeTab.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeTabScreen(),
      );
    },
    MyTripsTab.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MyTripsTabScreen(),
      );
    },
    SplashView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.AccountTabScreen]
class AccountTab extends _i3.PageRouteInfo<void> {
  const AccountTab({List<_i3.PageRouteInfo>? children})
      : super(
          AccountTab.name,
          initialChildren: children,
        );

  static const String name = 'AccountTab';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i1.HomeTabScreen]
class HomeTab extends _i3.PageRouteInfo<void> {
  const HomeTab({List<_i3.PageRouteInfo>? children})
      : super(
          HomeTab.name,
          initialChildren: children,
        );

  static const String name = 'HomeTab';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i1.MyTripsTabScreen]
class MyTripsTab extends _i3.PageRouteInfo<void> {
  const MyTripsTab({List<_i3.PageRouteInfo>? children})
      : super(
          MyTripsTab.name,
          initialChildren: children,
        );

  static const String name = 'MyTripsTab';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashView]
class SplashView extends _i3.PageRouteInfo<void> {
  const SplashView({List<_i3.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
