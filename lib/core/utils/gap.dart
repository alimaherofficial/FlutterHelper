import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// This class is used to create a gap.
/// Use it inside a Row or a Column
class Gap extends StatelessWidget {
  /// constructor
  const Gap({required this.value, super.key});

  /// value
  final double value;

  @override
  Widget build(BuildContext context) {
    // Check for Row parent
    final rowParent = context.findAncestorWidgetOfExactType<Row>();

    // Check for Column parent
    final columnParent = context.findAncestorWidgetOfExactType<Column>();

    if (rowParent != null) {
      return SizedBox(
        width: value.w,
      );
    } else if (columnParent != null) {
      return SizedBox(
        height: value.h,
      );
    } else {
      return Container();
    }
  }
}
