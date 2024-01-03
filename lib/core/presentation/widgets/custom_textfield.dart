// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/sized_x.dart';
import 'package:sizer/sizer.dart';

/// this class is the custom text field
class CustomTextField extends StatelessWidget {
  /// constructor
  const CustomTextField({
    required this.controller,
    super.key,
    this.hintText,
    this.focusNode,
    this.label,
    this.readOnly = false,
    this.useBorder = false,
    this.borderRadius = 6,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.prefixWidget,
    this.suffixWidget,
    this.lines,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.maxLength,
    this.fillColor,
    this.style,
    this.contentPaddingHorizontal,
    this.contentPaddingVertical,
    this.labelTextStyle,
    this.onTapOutside,
    this.autofillHints,
    this.hintStyle,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final String? hintText;

  final String? label;
  final TextInputType? keyboardType;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool obscureText;
  final int? lines;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool? readOnly;
  final bool useBorder;
  final TextStyle? labelTextStyle;
  final double? borderRadius;
  final int? maxLength;
  final Color? fillColor;
  final TextStyle? style;
  final double? contentPaddingVertical;
  final double? contentPaddingHorizontal;
  final void Function(PointerDownEvent)? onTapOutside;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            textAlign: TextAlign.left,
            style: labelTextStyle ??
                Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Theme.of(context).dividerColor),
          ),
        if (label != null) SizedX.h0p5,
        TextFormField(
          readOnly: readOnly!,
          onTapOutside: onTapOutside ??
              (_) {
                FocusScope.of(context).unfocus();
              },
          enabled: enabled,
          autofillHints: autofillHints,
          validator: validator,
          focusNode: focusNode,
          keyboardType: keyboardType ?? TextInputType.text,
          controller: controller,
          obscureText: obscureText,
          obscuringCharacter: '*',
          onChanged: onChanged,
          maxLines: lines ?? 1,
          maxLength: maxLength,
          style: style ??
              Theme.of(context).textTheme.displayMedium!.copyWith(
                    color: Theme.of(context).dividerColor,
                  ),
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintStyle ??
                TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.text.withOpacity(0.2),
                ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            counterStyle: const TextStyle(
              height: double.minPositive,
            ),
            counterText: '',
            errorMaxLines: 4,
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
            suffixIconConstraints: BoxConstraints(minWidth: 15.w),
          ),
        ),
      ],
    );
  }
}
