import 'dart:io';

import 'package:flutter/material.dart';
import 'package:helper/core/utils/toast_x.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// this class is used to lunch Url
class LauncherX {
  /// this method is used to return the url
  Future<void> launchUrl({
    required String url,
    required BuildContext context,
  }) async {
    final canLaunchUrl = await canLaunchUrlString(url);
    if (canLaunchUrl) {
      await launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    } else {
      // ignore: use_build_context_synchronously
      ToastX.showCustomToast(message: 'can not launch $url', context: context);
    }
  }

  /// this method is used to return the url
  Future<void> launchWhatsapp({
    required String message,
  }) async {
    final url = _urlForWhatsApp(phone: '+1646-504-5560', message: message);
    if (await canLaunchUrlString(url)) {
      await launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  /// this method is used to return the url for whatsapp
  String _urlForWhatsApp({required String phone, required String message}) {
    if (Platform.isAndroid) {
      /// for android
      return 'https://wa.me/+1646-504-5560/?text=${Uri.encodeComponent(message)}';
    } else {
      /// for ios
      return 'https://wa.me/1112911235?text=${Uri.encodeComponent(message)}';
    }
  }
}
