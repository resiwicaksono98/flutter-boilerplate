import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6750A4);
  static const secondary = Color(0xFF625B71);
  static const tertiary = Color(0xFF7D5260);
  static const error = Color(0xFFB3261E);
}

class AppSpacing extends ThemeExtension<AppSpacing> {
  final double small;
  final double medium;
  final double large;

  const AppSpacing({
    required this.small,
    required this.medium,
    required this.large,
  });

  @override
  ThemeExtension<AppSpacing> copyWith({
    double? small,
    double? medium,
    double? large,
  }) {
    return AppSpacing(
      small: small ?? this.small,
      medium: medium ?? this.medium,
      large: large ?? this.large,
    );
  }

  @override
  ThemeExtension<AppSpacing> lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) {
      return this;
    }
    return AppSpacing(
      small: lerpDouble(small, other.small, t)!,
      medium: lerpDouble(medium, other.medium, t)!,
      large: lerpDouble(large, other.large, t)!,
    );
  }

  static const regular = AppSpacing(
    small: 8.0,
    medium: 16.0,
    large: 24.0,
  );
}

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),
    extensions: const [
      AppSpacing.regular,
    ],
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
    ),
    extensions: const [
      AppSpacing.regular,
    ],
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
    ),
  );
}
