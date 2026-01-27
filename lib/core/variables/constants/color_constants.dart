part of 'package:rick_and_morty/core/variables/values/color_values.dart';

/// Color constants for Rick and Morty app.
///
/// ## Color Hierarchy:
/// - **Primary**: Dark (#202329) - Used for texts and main elements.
/// - **Secondary**: Light Gray (#F5F5F5) - Used for borders.
/// - **Tertiary**: White (#FFFFFF) - Used for backgrounds.
class _ColorConstants {
  // =========================================================================
  // PRIMARY COLOR - Dark for texts
  // =========================================================================
  static const int primaryValue = 0xFF202329;
  static const Color primary = Color(primaryValue);

  // =========================================================================
  // SECONDARY COLOR - Light gray for borders
  // =========================================================================
  static const int secondaryValue = 0xFFF5F5F5;
  static const Color secondary = Color(secondaryValue);

  // =========================================================================
  // TERTIARY COLOR - White for backgrounds
  // =========================================================================
  static const int tertiaryValue = 0xFFFFFFFF;
  static const Color tertiary = Color(tertiaryValue);

  // =========================================================================
  // GRAY SCALE
  // =========================================================================
  static const MaterialColor gray = MaterialColor(0xFF667085, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF5F5F5), // Tertiary
    200: Color(0xFFE5E5E5),
    300: Color(0xFFD4D4D4),
    400: Color(0xFFA3A3A3),
    500: Color(0xFF737373),
    600: Color(0xFF525252),
    700: Color(0xFF404040),
    800: Color(0xFF262626),
    900: Color(0xFF202329), // Primary
  });

  // =========================================================================
  // SEMANTIC COLORS
  // =========================================================================
  static const Color success = Color(0xFF17B26A);
  static const Color warning = Color(0xFFF79009);
  static const Color error = Color(0xFFF04438);
}
