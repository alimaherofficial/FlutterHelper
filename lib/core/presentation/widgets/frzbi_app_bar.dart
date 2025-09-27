import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper/core/extensions/num_extensions.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/assets.dart';

/// FrzbiAppBar is used to manage the app bar for the app
class FrzbiAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// FrzbiAppBar constructor
  const FrzbiAppBar({
    super.key,
    this.appBarHeight = kToolbarHeight,
    this.actionIcon = Assets.genIconsNotification,
  });

  /// appBarHeight is used to manage the app bar height
  final double appBarHeight;

  /// action icon button
  final String actionIcon;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: appBarHeight,
      leading: const SizedBox(),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: false,
      scrolledUnderElevation: 0,
      leadingWidth: 8.fw,
      title: SvgPicture.asset(
        fit: BoxFit.cover,
        height: 48.fh,
        width: 105.fw,
        Assets.genIconsSplashLogo,
        colorFilter: const ColorFilter.mode(
          AppColors.outrageousOrange,
          BlendMode.srcIn,
        ),
      ),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: 24.fw),
          onPressed: () {},
          icon: SvgPicture.asset(actionIcon, height: 40.fh, width: 32.fw),
        ),
      ],
    );
  }
}
