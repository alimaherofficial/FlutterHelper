import 'package:flutter/material.dart';

/// this class is used to get the position of a widget
class PositionHelper {
  /// this method is used to get the position of a widget
  static Future<Offset> getPosition(GlobalKey key) async {
    final currentContext = key.currentContext;

    if (currentContext == null) {
      debugPrint('currentContext is null');
      await Future<void>.delayed(const Duration(milliseconds: 10));
      return getPosition(key);
    } else {
      final renderBox = currentContext.findRenderObject()! as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);

      return position;
    }
  }
}
