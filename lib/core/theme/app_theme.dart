import 'package:rick_and_morty/core/ui.dart';

class AppTheme {
  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: TextValues.fontFamily,
      textTheme: TextValues.textTheme(context),

      // Colors
      primaryColor: ColorValues.primary,
      scaffoldBackgroundColor: ColorValues.tertiary,
      canvasColor: ColorValues.tertiary,
      dividerColor: ColorValues.secondary,

      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: ColorValues.primary,
        secondary: ColorValues.secondary,
        onSecondary: ColorValues.primary,
        tertiary: ColorValues.tertiary,
        onTertiary: ColorValues.primary,
        onSurface: ColorValues.primary,
        outline: ColorValues.secondary,
      ),
    );
  }
}

// class _CustomStyles {}
