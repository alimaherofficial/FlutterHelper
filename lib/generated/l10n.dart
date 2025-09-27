// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected Error, Please try again!`
  String get unexpectedErrorPleaseTryAgain {
    return Intl.message(
      'Unexpected Error, Please try again!',
      name: 'unexpectedErrorPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Request to ApiServer was canceled`
  String get requestToApiserverWasCanceled {
    return Intl.message(
      'Request to ApiServer was canceled',
      name: 'requestToApiserverWasCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Bad certificate with ApiServer`
  String get badCertificateWithApiserver {
    return Intl.message(
      'Bad certificate with ApiServer',
      name: 'badCertificateWithApiserver',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with ApiServer`
  String get receiveTimeoutWithApiserver {
    return Intl.message(
      'Receive timeout with ApiServer',
      name: 'receiveTimeoutWithApiserver',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with ApiServer`
  String get sendTimeoutWithApiserver {
    return Intl.message(
      'Send timeout with ApiServer',
      name: 'sendTimeoutWithApiserver',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout with ApiServer`
  String get connectionTimeoutWithApiserver {
    return Intl.message(
      'Connection timeout with ApiServer',
      name: 'connectionTimeoutWithApiserver',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error with ApiServer`
  String get unknownErrorWithApiserver {
    return Intl.message(
      'Unknown error with ApiServer',
      name: 'unknownErrorWithApiserver',
      desc: '',
      args: [],
    );
  }

  /// `Internal Server error, Please try later`
  String get internalServerErrorPleaseTryLater {
    return Intl.message(
      'Internal Server error, Please try later',
      name: 'internalServerErrorPleaseTryLater',
      desc: '',
      args: [],
    );
  }

  /// `Opps There was an Error, Please try again`
  String get oppsThereWasAnErrorPleaseTryAgain {
    return Intl.message(
      'Opps There was an Error, Please try again',
      name: 'oppsThereWasAnErrorPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Opps There was an Error, Please Login again`
  String get oppsThereWasAnErrorPleaseLoginAgain {
    return Intl.message(
      'Opps There was an Error, Please Login again',
      name: 'oppsThereWasAnErrorPleaseLoginAgain',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign in with Google.`
  String get failedToSignInWithGoogle {
    return Intl.message(
      'Failed to sign in with Google.',
      name: 'failedToSignInWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Failed to initialize Supabase: {error}`
  String failedToInitializeSupabaseE(Object error) {
    return Intl.message(
      'Failed to initialize Supabase: $error',
      name: 'failedToInitializeSupabaseE',
      desc: '',
      args: [error],
    );
  }

  /// `Could not find ID Token from generated credential.`
  String get couldNotFindIdTokenFromGeneratedCredential {
    return Intl.message(
      'Could not find ID Token from generated credential.',
      name: 'couldNotFindIdTokenFromGeneratedCredential',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
