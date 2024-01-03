// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper/core/utils/assets.dart';
import 'package:helper/core/utils/locale_helper.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom floating back button
class CustomFloatingBackButton extends StatelessWidget {
  /// constructor
  const CustomFloatingBackButton({
    required this.onTap,
    super.key,
    this.vertical,
    this.horizontal,
    this.icon,
    this.iconColor,
    this.containerColor,
    this.transformCondition,
  });
  final VoidCallback onTap;
  final double? vertical;
  final double? horizontal;
  final String? icon;
  final Color? iconColor;
  final Color? containerColor;
  final bool? transformCondition;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: vertical ?? 1.5.h,
        horizontal: horizontal ?? 1.w,
      ),
      child: InkWell(
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: onTap,
        child: Container(
          width: 15.w,
          height: 6.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: containerColor ?? Theme.of(context).cardColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipOval(
              child: Transform.flip(
                flipX: transformCondition ?? LocaleHelper.isArabic,
                child: Center(
                  child: SvgPicture.asset(
                    icon ?? Assets.genImagesSplashLogo,
                    colorFilter: ColorFilter.mode(
                      iconColor ?? Theme.of(context).dividerColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
