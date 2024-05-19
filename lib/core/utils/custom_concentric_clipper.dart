// ignore_for_file: lines_longer_than_80_chars

import 'dart:math';

import 'package:flutter/rendering.dart';

/// CustomConcentricClipper creates a path for a custom concentric circle animation.
///
/// This clipper is designed to create an expanding or contracting circle effect
/// based on the given progress, allowing for dynamic animations in Flutter widgets.
/// It calculates the necessary radius and positioning to create a circular clip
/// path that can expand or contract from a specified point.
///
/// Parameters:
///   - `progress`: A double value representing the current state of the animation,
///     where 0.0 signifies the start and 1.0 the end of the animation.
///   - `verticalPosition`: The vertical position of the circle's center as a
///     proportion of the height of the container, with 1.0 being the bottom.
///   - `radius`: The initial radius of the circle before any scaling applied by the
///     progress.
///   - `growFactor`: A scaling factor that affects how quickly the circle expands
///     or contracts as the progress changes.
///   - `reverse`: A boolean that, if true, reverses the direction of the animation,
///     making the circle contract rather than expand with increasing progress.
class CustomConcentricClipper extends CustomClipper<Path> {
  /// Creates a new instance of [CustomConcentricClipper].
  const CustomConcentricClipper({
    this.progress = 0.0,
    this.verticalPosition = 0.85,
    this.radius = 50.0,
    this.growFactor = 100.0,
    this.reverse = false,
  });

  /// [radius]
  final double radius;

  /// [verticalPosition]
  final double verticalPosition;

  /// [progress]
  final double progress;

  /// [growFactor]
  final double growFactor;

  /// [reverse]
  final bool reverse;

  /// Calculates and returns the path that should be clipped from the canvas.
  ///
  /// This method generates a circular path that dynamically adjusts its size
  /// based on the current progress, simulating an animation effect.
  ///
  /// Parameters:
  ///   - `size`: The size of the area (usually a widget) that the clip will be
  ///     applied to.
  ///
  /// Returns:
  ///   - A [Path] that defines the area to be clipped, creating the visual effect
  ///     of an expanding or contracting circle.
  @override
  Path getClip(Size size) {
    final path = Path();
    Rect shape;

    // Calculation of the maximum diagonal to ensure full coverage
    final diagonal = sqrt(pow(size.width, 2) + pow(size.height, 2));
    const maxAdjustedGrowFactor = 1000.0;

    // Adjustment of the grow factor to prevent unrealistic sizes
    var adjustedGrowFactor = growFactor * (diagonal / (radius * 2));
    adjustedGrowFactor = min(adjustedGrowFactor, maxAdjustedGrowFactor);

    // Calculation of the circle's center and radius based on current progress
    final x = size.width / 2;
    final y = size.height * verticalPosition;
    final double safeProgress = min(progress, 1.0);
    final currentRadius = radius + safeProgress * adjustedGrowFactor;

    if (x.isNaN || y.isNaN || currentRadius.isNaN || currentRadius.isInfinite) {
      throw Exception(
        'Invalid value detected in values used for Rect creation: x=$x, y=$y, currentRadius=$currentRadius',
      );
    }

    shape = Rect.fromCircle(center: Offset(x, y), radius: currentRadius);
    path.addOval(shape);
    return path;
  }

  /// Determines if the clipper should redraw its clip.
  ///
  /// This method checks if the current progress has changed compared to the old
  /// clipper, indicating whether the clip path needs to be recalculated to reflect
  /// the new state of the animation.
  ///
  /// Parameters:
  ///   - `oldClipper`: The previous instance of [CustomConcentricClipper] to compare
  ///     against.
  ///
  /// Returns:
  ///   - A boolean indicating whether the clip path should be recalculated (true)
  ///     or not (false).
  @override
  bool shouldReclip(CustomConcentricClipper oldClipper) {
    return progress != oldClipper.progress;
  }
}
