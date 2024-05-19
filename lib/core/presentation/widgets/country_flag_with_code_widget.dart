import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/extensions/num_extensions.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/sized_x.dart';

/// CountryFlagWithCodeWidget is used to manage the country flag with
/// code widget
class CountryFlagWithCodeWidget extends StatelessWidget {
  /// CountryFlagWithCodeWidget constructor
  const CountryFlagWithCodeWidget({
    required this.countryCode,
    required this.countryName,
    this.fontSize = 10,
    this.width = 14,
    this.height = 10,
    super.key,
  });

  /// Country code
  final FlagsCode countryCode;

  /// Country name
  final String countryName;

  /// width
  final double width;

  /// height
  final double height;

  /// font size
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flag.fromCode(
          countryCode,
          height: height.fh,
          width: width.fw,
          borderRadius: 1,
        ),
        SizedX.w1,
        Text(
          countryName,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.philippineGray,
                fontSize: fontSize.getResponsiveFontSize,
              ),
        ),
      ],
    );
  }
}
