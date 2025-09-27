// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(error) => "Failed to initialize Supabase: ${error}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "badCertificateWithApiserver": MessageLookupByLibrary.simpleMessage(
      "Bad certificate with ApiServer",
    ),
    "connectionTimeoutWithApiserver": MessageLookupByLibrary.simpleMessage(
      "Connection timeout with ApiServer",
    ),
    "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "couldNotFindIdTokenFromGeneratedCredential":
        MessageLookupByLibrary.simpleMessage(
          "Could not find ID Token from generated credential.",
        ),
    "failedToInitializeSupabaseE": m0,
    "failedToSignInWithGoogle": MessageLookupByLibrary.simpleMessage(
      "Failed to sign in with Google.",
    ),
    "internalServerErrorPleaseTryLater": MessageLookupByLibrary.simpleMessage(
      "Internal Server error, Please try later",
    ),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "oppsThereWasAnErrorPleaseLoginAgain": MessageLookupByLibrary.simpleMessage(
      "Opps There was an Error, Please Login again",
    ),
    "oppsThereWasAnErrorPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
      "Opps There was an Error, Please try again",
    ),
    "receiveTimeoutWithApiserver": MessageLookupByLibrary.simpleMessage(
      "Receive timeout with ApiServer",
    ),
    "requestToApiserverWasCanceled": MessageLookupByLibrary.simpleMessage(
      "Request to ApiServer was canceled",
    ),
    "sendTimeoutWithApiserver": MessageLookupByLibrary.simpleMessage(
      "Send timeout with ApiServer",
    ),
    "tryAgain": MessageLookupByLibrary.simpleMessage("Try Again"),
    "unexpectedErrorPleaseTryAgain": MessageLookupByLibrary.simpleMessage(
      "Unexpected Error, Please try again!",
    ),
    "unknownErrorWithApiserver": MessageLookupByLibrary.simpleMessage(
      "Unknown error with ApiServer",
    ),
  };
}
