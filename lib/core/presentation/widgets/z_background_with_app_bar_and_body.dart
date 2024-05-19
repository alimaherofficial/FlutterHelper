import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper/core/utils/assets.dart';

/// ZBackgroundWithAppBarAndBodyWidgets is used to manage the background,
///  app bar and body widgets
class ZBackgroundWithAppBarAndBody extends StatelessWidget {
  /// ZBackgroundWithAppBarAndBodyWidgets constructor
  const ZBackgroundWithAppBarAndBody({
    required this.appBarWidget,
    required this.bodyWidget,
    super.key,
  });

  /// appBarWidget is used to manage the app bar widget
  final Widget? appBarWidget;

  /// bodyWidget is used to manage the body widget
  final Widget? bodyWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: -30,
          child: SvgPicture.asset(
            Assets.genImagesZ,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Column(
          children: [
            if (appBarWidget != null) appBarWidget!,
            if (bodyWidget != null) bodyWidget!,
          ],
        ),
      ],
    );
  }
}
