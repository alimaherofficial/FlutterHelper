import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// this class is the responsive widget
class Responsive extends StatelessWidget {
  /// constructor
  const Responsive({required this.mobile, required this.tablet, super.key});

  /// mobile widget
  final Widget mobile;

  /// tablet widget
  final Widget tablet;

  @override
  Widget build(BuildContext context) {
    if (SizerUtil.deviceType == DeviceType.mobile) {
      return mobile;
    } else {
      return mobile;
    }
  }
}
