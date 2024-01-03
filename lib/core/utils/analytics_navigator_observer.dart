import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:helper/core/utils/analytics_helper.dart';

/// A navigator observer that uses AnalyticsHelper.setCurrentScreen to send
class AnalyticsNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('didPush: ${route.settings.name}');
    super.didPush(route, previousRoute);
    if (route.settings.name != null) {
      AnalyticsHelper.setCurrentScreen(route.settings.name!);
    }
  }
}
