// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/sized_x.dart';
import 'package:helper/core/utils/styles_helper.dart';
import 'package:sizer/sizer.dart';

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
    this.forceNotFillOnPressed = false,
    this.fillTextColor,
    this.notFillTextColor,
    this.notFillBackgroundColor,
    this.borderColor,
    this.iconArrowRight = Icons.arrow_back_ios_new,
    this.isThereIcon = false,
  });
  final VoidCallback onPressed;
  final String buttonText;
  final bool isFilled;

  final bool? forceNotFillOnPressed;
  final Color? fillBackgroundColor;
  final Color? notFillBackgroundColor;
  final Color? fillTextColor;
  final Color? notFillTextColor;
  final bool hasBorder;
  final Color? borderColor;
  final IconData iconArrowRight;
  final bool isThereIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isFilled
          ? onPressed
          : forceNotFillOnPressed!
              ? onPressed
              : null,
      style: ButtonStyle(
        minimumSize:
            MaterialStateProperty.all<Size>(Size(double.infinity, 6.h)),
        backgroundColor: MaterialStateProperty.all<Color>(
          isFilled
              ? fillBackgroundColor ?? Theme.of(context).primaryColor
              : notFillBackgroundColor ?? Theme.of(context).disabledColor,
        ),
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: hasBorder
                  ? isFilled
                      ? borderColor ?? Colors.transparent
                      : notFillTextColor ?? Theme.of(context).hoverColor
                  : Colors.transparent,
            ),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          getSemiBoldStyle(color: AppColors.white),
        ),
      ),
      child: isThereIcon
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconArrowRight,
                  color: Theme.of(context).dividerColor,
                  size: 1.5.h,
                ),
                SizedX.w2,
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: isFilled
                            ? fillTextColor ?? Theme.of(context).primaryColor
                            : notFillTextColor ??
                                Theme.of(context).disabledColor,
                      ),
                ),
              ],
            )
          : Text(
              buttonText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isFilled
                        ? fillTextColor ?? AppColors.white
                        : notFillTextColor ?? AppColors.white,
                  ),
            ),
    );
  }
}
