import 'package:flutter/material.dart';
import 'package:helper/core/extensions/num_extensions.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/main.dart';

///
class SnackX {
  /// a method to show [SnackX]
  static void showSnackBar({
    required String message,
    required BuildContext? context,
  }) {
    final currentContext = context ?? navigatorKey.currentContext;
    if (currentContext != null) {
      ScaffoldMessenger.of(currentContext).showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          content: SizedBox(
            height: 4.h,
            child: Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(currentContext).textTheme.bodyMedium!.copyWith(
                      color: AppColors.greenWhite,
                    ),
              ),
            ),
          ),
          backgroundColor: AppColors.primary,
        ),
      );
    } else {
      throw Exception('context is null');
    }
  }
}
