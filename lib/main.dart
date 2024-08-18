import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:helper/app.dart';
import 'package:helper/config/routes/app_router.dart';
import 'package:helper/core/injection_container.dart';
import 'package:helper/core/utils/bloc_observer.dart';
import 'package:helper/core/utils/database_manager.dart';
import 'package:helper/core/utils/supabase_helper.dart';
import 'package:helper/firebase_options.dart';
import 'package:isar/isar.dart';
import 'package:upgrader/upgrader.dart';

/// The [AppRouter] instance that is used to navigate across the app.
final appRouter = AppRouter();

/// The [Isar] instance that is used to interact with the database.
late final Isar isar;

/// A global key that will uniquely identify the Navigator
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();

  // Only call clearSavedSettings() during testing to reset internal values.
  // await Upgrader.clearSavedSettings(); // REMOVE this for release builds
  // Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Pass all uncaught asynchronous errors that aren't handled
  //by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(
      error,
      stack,
      fatal: true,
      printDetails: true,
    );
    return true;
  };

  Bloc.observer = AppBlocObserver();
  runApp(
    const FlutterHelper(),
  );
}

Future<void> _initApp() async {
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await dotenv.load();
  isar = await DatabaseManager.initIsar();
  await Future.wait<dynamic>([
    configureDependencies(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    Upgrader.sharedInstance.initialize(),
  ]);

  await getIt.get<SupaBaseHelper>().initializeSupaBase();
}
