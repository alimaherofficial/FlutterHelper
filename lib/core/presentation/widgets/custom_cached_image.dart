// ignore_for_file: public_member_api_docs

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:helper/core/extensions/num_extensions.dart';

/// this class is the image widget
class CustomCachedImage extends StatelessWidget {
  /// constructor
  const CustomCachedImage({
    required this.image,
    super.key,
    this.borderRadius = BorderRadius.zero,
    this.boxFit = BoxFit.cover,
    this.width,
    this.errorWidgetIconScale,
  });
  final String image;
  final BorderRadiusGeometry borderRadius;
  final BoxFit boxFit;
  final double? width;
  final double? errorWidgetIconScale;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        width: width ?? 100.w,
        child: CachedNetworkImage(
          filterQuality: FilterQuality.high,
          imageUrl: image,
          fit: boxFit,
          errorWidget: (context, error, stackTrace) {
            return Transform.scale(
              scale: errorWidgetIconScale ?? 0.3.sp,
              child: const Icon(
                Icons.error,
              ),
            );
          },
        ),
      ),
    );
  }
}
