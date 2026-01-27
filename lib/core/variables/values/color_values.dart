import 'package:flutter/material.dart';

part 'package:rick_and_morty/core/variables/constants/color_constants.dart';

/// Simplified color values for Rick and Morty app.
///
/// Colors:
/// - Primary (#202329): For texts and main elements
/// - Secondary (#F5F5F5): For borders
/// - Tertiary (#FFFFFF): For backgrounds
class ColorValues {
  // =========================================================================
  // DIRECT ACCESS COLORS
  // =========================================================================

  /// Primary color: Dark (#202329) - for texts
  static const Color primary = _ColorConstants.primary;

  /// Secondary color: Light Gray (#F5F5F5) - for borders
  static const Color secondary = _ColorConstants.secondary;

  /// Tertiary color: White (#FFFFFF) - for backgrounds
  static const Color tertiary = _ColorConstants.tertiary;

  /// Gray scale
  static const MaterialColor gray = _ColorConstants.gray;

  // =========================================================================
  // TEXT COLORS
  // =========================================================================

  /// Primary text color (dark)
  static Color textPrimary(BuildContext context) => primary;

  /// Secondary text color (medium gray)
  static Color textSecondary(BuildContext context) =>
      _ColorConstants.gray[600]!;

  /// Tertiary text color (light gray)
  static Color textTertiary(BuildContext context) => _ColorConstants.gray[500]!;

  /// Quaternary text color (lighter gray)
  static Color textQuaternary(BuildContext context) =>
      _ColorConstants.gray[400]!;

  /// Disabled text color
  static Color textDisabled(BuildContext context) => _ColorConstants.gray[300]!;

  /// Brand primary text (same as primary for this app)
  static Color textBrandPrimary(BuildContext context) => primary;

  /// Brand secondary text
  static Color textBrandSecondary(BuildContext context) =>
      _ColorConstants.gray[700]!;

  /// Brand tertiary text
  static Color textBrandTertiary(BuildContext context) =>
      _ColorConstants.gray[600]!;

  /// Error text color
  static Color textErrorPrimary(BuildContext context) => _ColorConstants.error;

  /// Warning text color
  static Color textWarningPrimary(BuildContext context) =>
      _ColorConstants.warning;

  /// Success text color
  static Color textSuccessPrimary(BuildContext context) =>
      _ColorConstants.success;

  /// White text
  static Color textWhite(BuildContext context) => Colors.white;

  // =========================================================================
  // BACKGROUND COLORS
  // =========================================================================

  /// Primary background (white)
  static Color bgPrimary(BuildContext context) => tertiary;

  /// Secondary background (light gray)
  static Color bgSecondary(BuildContext context) => secondary;

  /// Tertiary background
  static Color bgTertiary(BuildContext context) => _ColorConstants.gray[100]!;

  /// Quaternary background
  static Color bgQuaternary(BuildContext context) => _ColorConstants.gray[200]!;

  /// Active background
  static Color bgActive(BuildContext context) => secondary;

  /// Disabled background
  static Color bgDisabled(BuildContext context) => _ColorConstants.gray[100]!;

  /// Overlay background
  static Color bgOverlay(BuildContext context) =>
      primary.withValues(alpha: 0.8);

  /// Brand primary background
  static Color bgBrandPrimary(BuildContext context) => primary;

  /// Brand secondary background
  static Color bgBrandSecondary(BuildContext context) =>
      _ColorConstants.gray[800]!;

  /// Brand solid background
  static Color bgBrandSolid(BuildContext context) => primary;

  /// Error background
  static Color bgErrorPrimary(BuildContext context) =>
      _ColorConstants.error.withValues(alpha: 0.1);

  /// Warning background
  static Color bgWarningPrimary(BuildContext context) =>
      _ColorConstants.warning.withValues(alpha: 0.1);

  /// Success background
  static Color bgSuccessPrimary(BuildContext context) =>
      _ColorConstants.success.withValues(alpha: 0.1);

  // =========================================================================
  // BORDER COLORS
  // =========================================================================

  /// Primary border
  static Color borderPrimary(BuildContext context) =>
      _ColorConstants.gray[300]!;

  /// Secondary border (secondary color - light gray)
  static Color borderSecondary(BuildContext context) => secondary;

  /// Tertiary border
  static Color borderTertiary(BuildContext context) =>
      _ColorConstants.gray[100]!;

  /// Disabled border
  static Color borderDisabled(BuildContext context) =>
      _ColorConstants.gray[200]!;

  /// Disabled subtle border
  static Color borderDisabledSubtle(BuildContext context) => secondary;

  /// Brand border
  static Color borderBrand(BuildContext context) => primary;

  /// Brand solid border
  static Color borderBrandSolid(BuildContext context) => primary;

  /// Error border
  static Color borderError(BuildContext context) => _ColorConstants.error;

  /// Warning border
  static Color borderWarning(BuildContext context) => _ColorConstants.warning;

  /// Success border
  static Color borderSuccess(BuildContext context) => _ColorConstants.success;

  // =========================================================================
  // FOREGROUND COLORS (Icons, etc.)
  // =========================================================================

  /// Primary foreground
  static Color fgPrimary(BuildContext context) => primary;

  /// Secondary foreground
  static Color fgSecondary(BuildContext context) => _ColorConstants.gray[600]!;

  /// Tertiary foreground
  static Color fgTertiary(BuildContext context) => _ColorConstants.gray[500]!;

  /// Quaternary foreground
  static Color fgQuaternary(BuildContext context) => _ColorConstants.gray[400]!;

  /// Disabled foreground
  static Color fgDisabled(BuildContext context) => _ColorConstants.gray[300]!;

  /// Brand primary foreground
  static Color fgBrandPrimary(BuildContext context) => primary;

  /// Error foreground
  static Color fgErrorPrimary(BuildContext context) => _ColorConstants.error;

  /// Warning foreground
  static Color fgWarningPrimary(BuildContext context) =>
      _ColorConstants.warning;

  /// Success foreground
  static Color fgSuccessPrimary(BuildContext context) =>
      _ColorConstants.success;

  /// White foreground
  static Color fgWhite(BuildContext context) => Colors.white;

  // =========================================================================
  // BUTTON COLORS
  // =========================================================================

  /// Primary button background
  static Color buttonPrimaryBg(BuildContext context) => primary;

  /// Primary button foreground
  static Color buttonPrimaryFg(BuildContext context) => Colors.white;

  /// Secondary button background
  static Color buttonSecondaryBg(BuildContext context) => Colors.white;

  /// Secondary button foreground
  static Color buttonSecondaryFg(BuildContext context) => primary;

  /// Secondary button border
  static Color buttonSecondaryBorder(BuildContext context) =>
      _ColorConstants.gray[300]!;

  /// Error button background
  static Color buttonPrimaryErrorBg(BuildContext context) =>
      _ColorConstants.error;

  /// Error button foreground
  static Color buttonPrimaryErrorFg(BuildContext context) => Colors.white;

  // =========================================================================
  // ICON COLORS
  // =========================================================================

  /// Featured icon brand foreground
  static Color featuredIconFgBrand(BuildContext context) => primary;

  /// Featured icon error foreground
  static Color featuredIconLightFgError(BuildContext context) =>
      _ColorConstants.error;

  /// Featured icon warning foreground
  static Color featuredIconLightFgWarning(BuildContext context) =>
      _ColorConstants.warning;

  /// Featured icon success foreground
  static Color featuredIconLightFgSuccess(BuildContext context) =>
      _ColorConstants.success;

  // =========================================================================
  // UTILITY COLORS (for compatibility)
  // =========================================================================

  static Color utilityGray50(BuildContext context) => _ColorConstants.gray[50]!;
  static Color utilityGray100(BuildContext context) =>
      _ColorConstants.gray[100]!;
  static Color utilityGray200(BuildContext context) =>
      _ColorConstants.gray[200]!;
  static Color utilityGray300(BuildContext context) =>
      _ColorConstants.gray[300]!;
  static Color utilityGray400(BuildContext context) =>
      _ColorConstants.gray[400]!;
  static Color utilityGray500(BuildContext context) =>
      _ColorConstants.gray[500]!;
  static Color utilityGray600(BuildContext context) =>
      _ColorConstants.gray[600]!;
  static Color utilityGray700(BuildContext context) =>
      _ColorConstants.gray[700]!;
  static Color utilityGray800(BuildContext context) =>
      _ColorConstants.gray[800]!;
  static Color utilityGray900(BuildContext context) =>
      _ColorConstants.gray[900]!;

  static Color utilityBrand500(BuildContext context) => primary;
  static Color utilityBrand600(BuildContext context) => primary;
}
