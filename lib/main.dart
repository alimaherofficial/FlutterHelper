import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helper/app.dart';
import 'package:helper/core/injection_container.dart';
import 'package:helper/core/utils/bloc_observer.dart';
import 'package:helper/core/utils/database_manager.dart';

/// A global key that will uniquely identify the Scaffold
final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

/// A global key that will uniquely identify the Navigator
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Future.wait<dynamic>([
    configureDependencies(),
    DatabaseManager.initHive(),
    // Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // ),
    // Upgrader.sharedInstance.initialize(),
  ]);

  // Only call clearSavedSettings() during testing to reset internal values.
  // await Upgrader.clearSavedSettings(); // REMOVE this for release builds

  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  // FlutterError.onError = FirebaseCrashlytics.instance
  // .recordFlutterFatalError;
  // // Pass all uncaught asynchronous errors that aren't handled
  // //by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };

  Bloc.observer = AppBlocObserver();
  runApp(const HelperApp());
}
