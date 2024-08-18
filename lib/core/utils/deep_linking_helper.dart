import 'package:injectable/injectable.dart';

/// The helper class for deep linking.
@LazySingleton()
class DeepLinkingHelper {
  final String _supaBaseAuthDeepLink = 'com.fitspace.app://auth';

  /// Returns the SupaBase auth deep link.
  String get supaBaseAuthDeepLink => _supaBaseAuthDeepLink;
}
