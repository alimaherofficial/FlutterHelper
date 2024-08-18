import 'package:url_launcher/url_launcher.dart';

/// A helper class to launch URLs
class UrlLauncherHelper {
  /// A function to check if a URL can be launched
  static Future<void> launchURL(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw Exception('Could not launch $uri');
    }
  }

  /// open mail app
  static Future<void> openMailApp() async {
    final emailLaunchUri = Uri(
      scheme: 'mailto',
    );
    try {
      await launchURL(emailLaunchUri);
    } on Exception catch (_) {
      await launchURL(
        Uri.parse(
          'https://mail.google.com',
        ),
      );
    }
  }
}
