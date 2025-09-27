import 'package:flutter/material.dart';
import 'package:helper/core/presentation/widgets/dialogs/options_dialog.dart';

/// showClearMessagesDialog is used to show the clear messages dialog
Future<E?> showOptionsDialog<E extends Object>({
  required BuildContext context,
  required String title,
  required Map<String, E> options,
}) async {
  assert(options.isNotEmpty, 'Options cannot be empty');
  return showDialog<E>(
    context: context,
    useSafeArea: false,
    builder: (context) {
      return OptionsDialog<E>(title: title, options: options);
    },
  );
}
