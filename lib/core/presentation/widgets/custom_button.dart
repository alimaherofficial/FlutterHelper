// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:helper/core/extensions/num_extensions.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/sized_x.dart';

/// this class is the custom button
class CustomButton extends StatelessWidget {
  /// constructor
  const CustomButton({
    required this.onPressed,
    required this.buttonText,
    required this.isFilled,
    this.hasBorder = true,
    super.key,
    this.fillBackgroundColor,
    this.fillTextColor,
    this.notFillTextColor,
    this.notFillBackgroundColor,
    this.borderColor,
    this.iconWidget,
    this.isThereIcon = false,
    this.height,
    this.borderRadius = 14,
    this.textStyle,
  });
  final VoidCallback onPressed;
  final String buttonText;
  final bool isFilled;

  final Color? fillBackgroundColor;
  final Color? notFillBackgroundColor;
  final Color? fillTextColor;
  final Color? notFillTextColor;
  final bool hasBorder;
  final Color? borderColor;
  final Widget? iconWidget;
  final bool isThereIcon;
  final double? height;
  final double borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      visualDensity: VisualDensity.adaptivePlatformDensity.copyWith(
        horizontal: VisualDensity.maximumDensity,
      ),
      padding: EdgeInsets.zero,
      height: height ?? 6.h,
      minWidth: double.infinity,
      color: isFilled
          ? fillBackgroundColor ?? Theme.of(context).primaryColor
          : notFillBackgroundColor ?? Theme.of(context).disabledColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: BorderSide(
          color: hasBorder
              ? isFilled
                  ? borderColor ?? Colors.transparent
                  : notFillTextColor ?? Theme.of(context).hoverColor
              : Colors.transparent,
        ),
      ),
      onPressed: isFilled ? onPressed : () {},
      child: isThereIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconWidget ??
                    Icon(
                      Icons.arrow_back_ios_new,
                      color: Theme.of(context).dividerColor,
                      size: 1.5.h,
                    ),
                SizedX.w2,
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: textStyle ??
                      Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: isFilled
                                ? fillTextColor ??
                                    Theme.of(context).primaryColor
                                : notFillTextColor ??
                                    Theme.of(context).disabledColor,
                          ),
                ),
              ],
            )
          : Text(
              buttonText,
              textAlign: TextAlign.center,
              style: textStyle ??
                  Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isFilled
                            ? fillTextColor ?? AppColors.jungleGreen
                            : notFillTextColor ??
                                Theme.of(context).disabledColor,
                      ),
            ),
    );
  }
}

extension CustomButtonX on CustomButton {
  /// this method is used to change the button text
  CustomButton amberStyle(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      buttonText: buttonText,
      isFilled: isFilled,
      hasBorder: hasBorder,
      fillBackgroundColor: fillBackgroundColor ?? AppColors.amber,
      fillTextColor: fillTextColor ?? AppColors.aquaDeep,
      notFillTextColor: notFillTextColor,
      notFillBackgroundColor: notFillBackgroundColor,
      borderColor: borderColor,
      iconWidget: iconWidget,
      isThereIcon: isThereIcon,
      height: height ?? 41.fh,
      borderRadius: borderRadius,
      textStyle: textStyle ??
          Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppColors.aquaDeep,
              ),
    );
  }
}
