import 'package:flutter/material.dart';
import 'package:nourish/core/theme/app_color.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final colors = lightThemeColors;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: colors.grey[100],
      colorScheme: ColorScheme.light(
        primary: colors.purple,
        onPrimary: colors.white,
        secondary: colors.peach,
        surface: colors.grey[100]!,
        onSurface: colors.plum[900]!,
        error: colors.error,
      ),
      fontFamily: 'Roboto',
    );
  }
}
