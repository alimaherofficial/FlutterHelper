import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:helper/core/injection_container.dart';
import 'package:helper/core/utils/deep_linking_helper.dart';
import 'package:helper/generated/l10n.dart';
import 'package:injectable/injectable.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// SupaBaseHelper is a helper class that contains all the methods that
/// are used to interact with the SupaBase database.
@LazySingleton()
class SupaBaseHelper {
  /// Returns the SupaBase client instance.
  SupabaseClient get supabase => _supabase;

  /// The [SupabaseClient] instance that is used to interact with
  ///  the SupaBase database.
  late final SupabaseClient _supabase = Supabase.instance.client;

  /// Initializes the SupaBase client with the
  /// SupaBase URL and the SupaBase key.
  Future<void> initializeSupaBase() async {
    try {
      await Supabase.initialize(
        url: dotenv.env['SUPABASE_URL']!,
        anonKey: dotenv.env['SUPABASE_KEY']!,
        debug: true,
      );
    } catch (e) {
      throw Exception(S.current.failedToInitializeSupabaseE(e));
    }

    Future.delayed(const Duration(seconds: 1), () async {
      try {
        // await supabase.auth.signOut();
        await supabase.auth.refreshSession();
      } catch (e) {
        log('Failed to refresh session: $e');
        // await appRouter.replaceAll([const HomeAuthRoute()]);
      }
    });
  }

  /// Signs in the user with the Google provider.
  Future<AuthResponse> nativeGoogleSignIn() async {
    /// Web Client ID that you registered with Google Cloud.
    final webClientId = dotenv.env['WEB_CLIENT_ID'];

    /// iOS Client ID that you registered with Google Cloud.
    final iosClientId = dotenv.env['IOS_CLIENT_ID'];

    final googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      throw Exception(S.current.failedToSignInWithGoogle);
    }
    final googleAuth = await googleUser.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw Exception(S.current.failedToSignInWithGoogle);
    }
    if (idToken == null) {
      throw Exception(S.current.failedToSignInWithGoogle);
    }

    final result = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    return result;
  }

  /// Performs Apple sign in on iOS or macOS

  Future<AuthResponse> signInWithAppleNative() async {
    final rawNonce = supabase.auth.generateRawNonce();
    final hashedNonce = sha256.convert(utf8.encode(rawNonce)).toString();

    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
      nonce: hashedNonce,
    );

    final idToken = credential.identityToken;
    if (idToken == null) {
      throw AuthException(
        S.current.couldNotFindIdTokenFromGeneratedCredential,
      );
    }

    return supabase.auth.signInWithIdToken(
      provider: OAuthProvider.apple,
      idToken: idToken,
      nonce: rawNonce,
    );
  }

  /// sign in with apple on web
  Future<void> signInWithAppleWeb() async {
    await supabase.auth.signInWithOAuth(
      OAuthProvider.apple,
      redirectTo: getIt.get<DeepLinkingHelper>().supaBaseAuthDeepLink,
    );
  }
}

/// [SupabaseTables] is an enum that contains the metadata keys that
/// are used to determine the status of the account.
enum SupabaseTables {
  /// [profiles] is used to determine the bio of the account.
  profiles('profiles'),
  ;

  /// [SupabaseTables] constructor.
  const SupabaseTables(this.status);

  /// [status] is the status of the account.
  final String status;
}
