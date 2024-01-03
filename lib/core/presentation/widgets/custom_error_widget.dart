import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper/core/presentation/widgets/custom_button.dart';
import 'package:helper/core/utils/app_colors.dart';
import 'package:helper/core/utils/assets.dart';
import 'package:helper/core/utils/sized_x.dart';
import 'package:helper/generated/l10n.dart';
import 'package:sizer/sizer.dart';

/// [CustomErrorWidget]
class CustomErrorWidget extends StatelessWidget {
  /// [CustomErrorWidget] constructor
  const CustomErrorWidget({
    required this.errorText,
    required this.tryAgainFunction,
    this.bottomText,
    super.key,
  });

  /// Error Text
  final String errorText;

  /// bottom text
  final String? bottomText;

  /// Try Again Function
  final void Function() tryAgainFunction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: Align(
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.genImagesErrorFace,
              height: 8.h,
              colorFilter: ColorFilter.mode(
                Colors.grey.withOpacity(0.6),
                BlendMode.srcIn,
              ),
            ),
            SizedX.h3,
            Text(
              errorText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).dividerColor,
                  ),
            ),
            SizedX.h3,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: CustomButton(
                onPressed: tryAgainFunction,
                buttonText: bottomText ?? S.of(context).tryAgain,
                isFilled: true,
                fillBackgroundColor: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
