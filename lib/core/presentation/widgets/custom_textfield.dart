// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helper/core/extensions/num_extensions.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/sized_x.dart';

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
    this.labelTextStyle,
    this.onTapOutside,
    this.autofillHints,
    this.hintStyle,
    this.capitalizeFirstCharacter = false,
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
  final int? maxLength;
  final Color? fillColor;
  final TextStyle? style;
  final void Function(PointerDownEvent)? onTapOutside;
  final Iterable<String>? autofillHints;
  final TextStyle? hintStyle;
  final bool? capitalizeFirstCharacter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            textAlign: TextAlign.left,
            style: labelTextStyle ??
                Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).dividerColor,
                    ),
          ),
        if (label != null) SizedX.h0p5,
        TextFormField(
          textCapitalization: capitalizeFirstCharacter!
              ? TextCapitalization.sentences
              : TextCapitalization.none,
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
                Theme.of(
                  context,
                ).textTheme.displayMedium!.copyWith(color: AppColors.aquaDeep),
            filled: true,

            fillColor: AppColors.greenBackground5,
            counterStyle: const TextStyle(height: double.minPositive),
            // none
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.sp),
              borderSide: BorderSide.none,
            ),

            contentPadding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 1.8.h,
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
