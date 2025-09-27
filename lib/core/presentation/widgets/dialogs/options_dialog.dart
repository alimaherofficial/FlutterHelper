// ignore_for_file: public_member_api_docs

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:helper/core/extensions/num_extensions.dart';
import 'package:helper/core/presentation/widgets/custom_button.dart';
import 'package:helper/core/utils/app_colors.dart';

class OptionsDialog<E> extends StatelessWidget {
  const OptionsDialog({required this.title, required this.options, super.key});

  final String title;
  final Map<String, E> options;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
            tileMode: TileMode.repeated,
          ),
          child: Container(color: AppColors.greenWhite.withOpacity(0.5)),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.w),
          width: double.infinity,
          padding: EdgeInsets.only(top: 10.sp, bottom: 6.sp),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.aquaDeep),
              ),
              ...options.entries.map(
                (entry) => Column(
                  children: [
                    CustomButton(
                      onPressed: () async {
                        Navigator.of(context).pop<E>(entry.value);
                      },
                      buttonText: entry.key,
                      isFilled: true,
                      fillBackgroundColor: Colors.transparent,
                      textStyle: entry.key != options.keys.last
                          ? Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.red,
                              )
                          : Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: AppColors.mineShaft,
                              ),
                    ),
                    if (entry.key != options.keys.last)
                      const Divider(
                        color: AppColors.mercury,
                        thickness: 1,
                        height: 0,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
