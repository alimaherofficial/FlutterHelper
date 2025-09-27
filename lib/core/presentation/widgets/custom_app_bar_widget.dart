import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper/core/extensions/num_extensions.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/assets.dart';

/// CustomAppBar is used to manage the Inside Screens app bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// CustomAppBar constructor
  const CustomAppBar({
    required this.titleText,
    super.key,
    this.appBarHeight = kToolbarHeight,
    this.actionIcon,
    this.onBackButtonPressed,
    this.actionOnPressed,
  });

  /// appBarHeight is used to manage the app bar height
  final double appBarHeight;

  /// action icon button
  final String? actionIcon;

  /// titleText
  final String titleText;

  /// onBackButtonPressed
  final VoidCallback? onBackButtonPressed;

  /// actionOnPressed
  final VoidCallback? actionOnPressed;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: appBarHeight,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      leading: InkWell(
        onTap: onBackButtonPressed ?? () => context.router.back(),
        child: Align(
          child: SvgPicture.asset(
            Assets.genIconsBack,
            colorFilter: const ColorFilter.mode(
              AppColors.outrageousOrange,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
      title: Text(titleText, style: Theme.of(context).textTheme.titleMedium),
      backgroundColor: Colors.transparent,
      actions: actionIcon == null
          ? null
          : [
              IconButton(
                padding: EdgeInsets.symmetric(horizontal: 24.fw),
                onPressed: actionOnPressed,
                icon: Align(child: SvgPicture.asset(actionIcon!)),
              ),
            ],
    );
  }
}
