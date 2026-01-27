import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Text values and typography configuration.
///
/// All font family references should use [TextValues.fontFamily].
abstract class TextValues {
  // -------------------------------------------------
  // <---------------- Font family ------------------>
  // -------------------------------------------------

  /// The app's font family name (Poppins).
  /// Use this everywhere you need to reference the font.
  static String get fontFamily => GoogleFonts.poppins().fontFamily!;

  /// Returns a TextTheme with the app's font family applied.
  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme.apply(fontFamily: fontFamily);
  }

  /// Returns a base TextStyle with the app's font family.
  static TextStyle get style => TextStyle(fontFamily: fontFamily);

  // -------------------------------------------------
  // <---------------- Font sizing ------------------>
  // -------------------------------------------------

  /// Text size for extra small text (12)
  static const double textXs = 12;

  /// Text size for small text (14)
  static const double textSm = 14;

  /// Text size for medium text (16)
  static const double textMd = 16;

  /// Text size for large text (18)
  static const double textLg = 18;

  /// Text size for extra large text (20)
  static const double textXl = 20;

  /// Text size for extra small display text / title (24)
  static const double displayXs = 24;

  /// Text size for small display text / title (30)
  static const double displaySm = 30;

  /// Text size for medium display text / title (36)
  static const double displayMd = 36;

  /// Text size for large display text / title (48)
  static const double displayLg = 48;

  /// Text size for extra large display text / title (60)
  static const double displayXl = 60;

  /// Text size for extra extra large display text / title (72)
  static const double display2xl = 72;

  // -------------------------------------------------
  // <---------------- Font weight ------------------>
  // -------------------------------------------------

  /// Extra light font weight (200)
  static const extraLight = FontWeight.w200;

  /// Light font weight (300)
  static const light = FontWeight.w300;

  /// Regular font weight (400)
  static const regular = FontWeight.w400;

  /// Medium font weight (500)
  static const medium = FontWeight.w500;

  /// Semibold font weight (600)
  static const semibold = FontWeight.w600;

  /// Bold font weight (700)
  static const bold = FontWeight.w700;

  /// Extra bold font weight (800)
  static const extraBold = FontWeight.w800;

  /// Black font weight (900)
  static const black = FontWeight.w900;
}
