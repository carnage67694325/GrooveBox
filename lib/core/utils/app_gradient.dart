import 'package:flutter/material.dart';
import 'package:groove_box/core/utils/app_color.dart';

class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      AppColors.primary,
      AppColors.primaryDark,
      AppColors.secondaryDark,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static LinearGradient diagonalGradient = LinearGradient(
    colors: [
      AppColors.cardColor.withOpacity(0.5), // Adjust opacity value (0.0 - 1.0)
      AppColors.primaryDark.withOpacity(0.2),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient verticalGradient = LinearGradient(
    colors: [
      AppColors.primaryDark, // Dark Purple
      AppColors.primary, // Lighter Purple
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const LinearGradient horizontalGradient = LinearGradient(
    colors: [
      AppColors.primary, // Purple
      AppColors.secondary, // Soft Lavender
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const RadialGradient radialGradient = RadialGradient(
    colors: [
      AppColors.primaryDark,
      AppColors.background,
      AppColors.primary,
    ],
    center: Alignment.center,
    radius: .7, // How far the gradient should reach from the center
  );
  static const SweepGradient sweepGradient = SweepGradient(
    colors: [
      AppColors.accent, // Pink
      AppColors.primary, // Purple
      AppColors.secondary, // Soft Lavender
      AppColors.accent, // Pink again, creating a cycle
    ],
    center: Alignment.center,
    startAngle: 0.0,
    endAngle: 3.14 * 2, // Full circle (360 degrees)
  );
  static const LinearGradient stoppedGradient = LinearGradient(
    colors: [
      AppColors.primaryDark, // Dark Purple
      AppColors.primary, // Lighter Purple
      AppColors.accent, // Pink
    ],
    stops: [0.2, 0.5, 0.8], // Where the color transition happens
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
