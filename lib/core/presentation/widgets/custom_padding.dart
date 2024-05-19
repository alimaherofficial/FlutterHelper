import 'package:flutter/material.dart';
import 'package:helper/core/extensions/num_extensions.dart';

/// this class is the custom padding
class CustomPadding extends StatelessWidget {
  /// constructor
  const CustomPadding({
    required this.child,
    super.key,
    this.isVertical = true,
    this.isHorizontal = true,
  });

  /// child of the custom padding
  final Widget child;

  /// is vertical
  final bool isVertical;

  /// is horizontal
  final bool isHorizontal;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isHorizontal ? 24.fw : 0.0,
        vertical: isVertical ? 1.h : 0.0,
      ),
      child: child,
    );
  }
}
