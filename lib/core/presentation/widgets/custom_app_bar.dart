import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper/core/utils/assets.dart';
import 'package:helper/core/utils/font_size_helper.dart';
import 'package:helper/core/utils/locale_helper.dart';
import 'package:helper/core/utils/sized_x.dart';
import 'package:sizer/sizer.dart';

/// this widget is used to show the custom app bar
PreferredSize customAppBar({
  required BuildContext context,
  required String title,
  VoidCallback? backButtonPressed,
  VoidCallback? onTitlePressed,
  double fontSize = FontSizeHelper.s17,
  Widget? actionWidget,
  VoidCallback? actionCallback,
  bool isCenterTitle = true,
  double? elevation = 0.3,
  double? appBarHeight = 6,
  FontWeight? fontWeight = FontWeight.w600,
  PreferredSizeWidget? bottom = const PreferredSize(
    preferredSize: Size.fromHeight(0),
    child: SizedBox(),
  ),
  Color? backgroundColor,
}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, appBarHeight!.h),
    child: AppBar(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      scrolledUnderElevation: 0,
      elevation: elevation,
      shadowColor: Theme.of(context).dividerColor,
      titleSpacing: 0,
      leadingWidth: 15.w,
      surfaceTintColor: Theme.of(context).cardColor,
      bottom: bottom,
      leading: backButtonPressed == null
          ? null
          : InkWell(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: backButtonPressed,
              child: Transform.flip(
                flipX: !LocaleHelper.isArabic,
                child: Transform.scale(
                  scale: 0.28.sp,
                  child: SvgPicture.asset(
                    Assets.genIconsChevron,
                  ),
                ),
              ),
            ),
      centerTitle: isCenterTitle,
      title: Padding(
        padding: isCenterTitle
            ? EdgeInsets.symmetric(horizontal: 3.w)
            : EdgeInsets.only(left: 5.w, top: 20),
        child: InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: onTitlePressed,
          child: AutoSizeText(
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            minFontSize: 8.sp,
            stepGranularity: 2.sp,
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: fontSize.sp,
                  fontWeight: fontWeight,
                  color: Theme.of(context).dividerColor,
                ),
          ),
        ),
      ),
      actions: [
        if (actionWidget != null && actionCallback != null)
          Center(
            child: InkWell(
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: actionCallback,
              child: actionWidget,
            ),
          ),
        SizedX.w4,
      ],
    ),
  );
}
