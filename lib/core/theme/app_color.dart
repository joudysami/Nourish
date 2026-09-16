import 'package:flutter/material.dart';

abstract class AppColors {
  MaterialColor get plum; // Deep Slate Plum (Hero card, bottom nav, brand dark)
  MaterialColor get purple; // Lavender / Violet (App logo, primary accent, tags)
  MaterialColor get peach; // Peach / Warm Coral (Camera button, highlights)
  MaterialColor get grey; // Warm Neutral Grey & Slate
  MaterialColor get flame; // Warm Orange (Instant AI badge)
  Brightness get brightness;
  Color get error;
  Color get success;
  Color get white;
  Color get shadow;
 
}
class LightThemeColor implements AppColors {
  @override
  Brightness get brightness => Brightness.light;

  @override
  MaterialColor get plum => MaterialColor(0xFF2B1E3A, const <int, Color>{
        50: Color(0xFFF3EFF7),
        100: Color(0xFFDFD7EA),
        200: Color(0xFFC4B6D8),
        300: Color(0xFFA591C2),
        400: Color(0xFF7C649E),
        500: Color(0xFF4C3766),
        600: Color(0xFF3B2A50),
        700: Color(0xFF2B1E3A), // Primary brand dark
        800: Color(0xFF23182F),
        900: Color(0xFF191122),
        950: Color(0xFF0F0A15),
      });

  @override
  MaterialColor get purple => MaterialColor(0xFF8C78D8, const <int, Color>{
        50: Color(0xFFF4F1FB),
        100: Color(0xFFE5DFF6),
        200: Color(0xFFCBBFEE),
        300: Color(0xFFB19FE6),
        400: Color(0xFF9E8AE0),
        500: Color(0xFF8C78D8), // Main accent lavender
        600: Color(0xFF7A65C7),
        700: Color(0xFF6751B4),
        800: Color(0xFF553EA0),
        900: Color(0xFF3F2A83),
        950: Color(0xFF2B1C5D),
      });

  @override
  MaterialColor get peach => MaterialColor(0xFFF3AF9D, const <int, Color>{
        50: Color(0xFFFDF5F2),
        100: Color(0xFFFCE7E1),
        200: Color(0xFFF8D1C7),
        300: Color(0xFFF5BEB0),
        400: Color(0xFFF3AF9D), // Main peach
        500: Color(0xFFE99681),
        600: Color(0xFFD67861),
        700: Color(0xFFBC5B44),
        800: Color(0xFF9E442F),
        900: Color(0xFF752F1F),
        950: Color(0xFF4D1C11),
      });

  @override
  MaterialColor get flame => MaterialColor(0xFFED8936, const <int, Color>{
        50: Color(0xFFFEF3EB),
        100: Color(0xFFFDE4D2),
        200: Color(0xFFFBC6A3),
        300: Color(0xFFF6A36E),
        400: Color(0xFFED8936),
        500: Color(0xFFDD6B20),
        600: Color(0xFFC05621),
        700: Color(0xFF9C4221),
        800: Color(0xFF7B341E),
        900: Color(0xFF5A2518),
        950: Color(0xFF37140B),
      });


  @override
  MaterialColor get grey => MaterialColor(0xFFFAF7F2, const <int, Color>{
        50: Color(0xFFFDFBF8),
        100: Color(0xFFFAF7F2), // Canvas background
        200: Color(0xFFF2ECE4),
        300: Color(0xFFE5DDD2),
        400: Color(0xFFC9C0B2),
        500: Color(0xFFA69D8F),
        600: Color(0xFF7F7668),
        700: Color(0xFF5E564A),
        800: Color(0xFF3F3931),
        900: Color(0xFF25211B),
        950: Color(0xFF151310),
      });
 
  @override
  Color get error => const Color(0xFFE53E3E);
  @override
  Color get success => const Color(0xFF38A169);
  @override
  Color get white => const Color(0xFFFFFFFF);
 
  @override
  Color get shadow => const Color(0x142B1E3A);

 
  
}

class DarkThemeColor implements AppColors {
  @override
  Brightness get brightness => Brightness.dark;

  @override
  MaterialColor get plum => lightThemeColors.plum;
  @override
  MaterialColor get purple => lightThemeColors.purple;
  @override
  MaterialColor get peach => lightThemeColors.peach;
  @override
  MaterialColor get flame => lightThemeColors.flame;
  @override
  MaterialColor get grey => lightThemeColors.grey;
  @override
  Color get error => const Color(0xFFFC8181);
  @override
  Color get success => const Color(0xFF48BB78);
  @override
  Color get white => const Color(0xFFFFFFFF);
  @override
  Color get shadow => const Color(0x33000000);
 
}

final lightThemeColors = LightThemeColor();
final darkThemeColors = DarkThemeColor();

extension ThemeColors on BuildContext {
  AppColors get colors =>
      Theme.of(this).brightness == Brightness.light
          ? lightThemeColors
          : darkThemeColors;

  AppColors get appColors => colors;
}