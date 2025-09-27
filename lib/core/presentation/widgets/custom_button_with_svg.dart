import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helper/core/extensions/num_extensions.dart';

/// CustomButtonWithSvg
class CustomButtonWithSvg extends StatelessWidget {
  /// CustomButtonWithSvg constructor
  const CustomButtonWithSvg({
    required this.onTap,
    required this.buttonText,
    required this.svgPicture,
    this.isRight = false,
    this.isLeft = false,
    super.key,
  });

  /// onTap
  final void Function()? onTap;

  /// ButtonText
  final String buttonText;

  /// IsRight
  final bool isRight;

  /// IsLeft
  final bool isLeft;

  /// Svg Picture
  final SvgPicture svgPicture;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isRight) svgPicture,
            if (isRight) SizedBox(width: 10.fw),
            Text(buttonText, style: Theme.of(context).textTheme.titleLarge),
            if (isLeft) SizedBox(width: 10.fw),
            if (isLeft) svgPicture,
          ],
        ),
      ),
    );
  }
}
