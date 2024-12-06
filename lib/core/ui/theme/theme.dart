import 'package:flutter/material.dart';
import 'package:flutter_starter/core/ui/theme/colors.dart';
import 'package:flutter_starter/core/ui/theme/typography.dart';

class AppTheme {
  // light color scheme
  static final ColorScheme lightColorScheme = ColorScheme.light(
    primary: AppColors.primaryColor,
    error: AppColors.errorColor,
    surface: AppColors.backgroundColor,
  );

  // app theme
  static ThemeData appThemeData = ThemeData(
      colorScheme: lightColorScheme,
      textTheme: AppTypography.textTheme,
      useMaterial3: true, // Use Material3 theming
    );
}
