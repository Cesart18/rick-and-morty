import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/variables/values/color_values.dart';
import 'package:rick_and_morty/core/variables/values/text_values.dart';

/// Custom text styles accessible via context.
///
/// Usage: `context.appTextStyles.displayTwoExtraLarge`
class AppTextStyles {
  const AppTextStyles(this._context);

  final BuildContext _context;

  // ===========================================================================
  // DISPLAY STYLES
  // ===========================================================================

  /// Display 2XL - 72px
  TextStyle get display2xl => TextValues.style.copyWith(
    fontSize: TextValues.display2xl,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Display 2XL Semibold
  TextStyle get display2xlSemibold =>
      display2xl.copyWith(fontWeight: TextValues.semibold);

  /// Display 2XL Bold
  TextStyle get display2xlBold =>
      display2xl.copyWith(fontWeight: TextValues.bold);

  /// Display XL - 60px
  TextStyle get displayXl => TextValues.style.copyWith(
    fontSize: TextValues.displayXl,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Display XL Semibold
  TextStyle get displayXlSemibold =>
      displayXl.copyWith(fontWeight: TextValues.semibold);

  /// Display XL Bold
  TextStyle get displayXlBold =>
      displayXl.copyWith(fontWeight: TextValues.bold);

  /// Display Large - 48px
  TextStyle get displayLg => TextValues.style.copyWith(
    fontSize: TextValues.displayLg,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Display Large Semibold
  TextStyle get displayLgSemibold =>
      displayLg.copyWith(fontWeight: TextValues.semibold);

  /// Display Large Bold
  TextStyle get displayLgBold =>
      displayLg.copyWith(fontWeight: TextValues.bold);

  /// Display Medium - 36px
  TextStyle get displayMd => TextValues.style.copyWith(
    fontSize: TextValues.displayMd,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Display Medium Semibold
  TextStyle get displayMdSemibold =>
      displayMd.copyWith(fontWeight: TextValues.semibold);

  /// Display Medium Bold
  TextStyle get displayMdBold =>
      displayMd.copyWith(fontWeight: TextValues.bold);

  /// Display Small - 30px
  TextStyle get displaySm => TextValues.style.copyWith(
    fontSize: TextValues.displaySm,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Display Small Semibold
  TextStyle get displaySmSemibold =>
      displaySm.copyWith(fontWeight: TextValues.semibold);

  /// Display Small Bold
  TextStyle get displaySmBold =>
      displaySm.copyWith(fontWeight: TextValues.bold);

  /// Display XS - 24px
  TextStyle get displayXs => TextValues.style.copyWith(
    fontSize: TextValues.displayXs,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Display XS Semibold
  TextStyle get displayXsSemibold =>
      displayXs.copyWith(fontWeight: TextValues.semibold);

  /// Display XS Bold
  TextStyle get displayXsBold =>
      displayXs.copyWith(fontWeight: TextValues.bold);

  // ===========================================================================
  // TEXT STYLES
  // ===========================================================================

  /// Text XL - 20px
  TextStyle get textXl => TextValues.style.copyWith(
    fontSize: TextValues.textXl,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Text XL Semibold
  TextStyle get textXlSemibold =>
      textXl.copyWith(fontWeight: TextValues.semibold);

  /// Text XL Bold
  TextStyle get textXlBold => textXl.copyWith(fontWeight: TextValues.bold);

  /// Text Large - 18px
  TextStyle get textLg => TextValues.style.copyWith(
    fontSize: TextValues.textLg,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Text Large Semibold
  TextStyle get textLgSemibold =>
      textLg.copyWith(fontWeight: TextValues.semibold);

  /// Text Large Bold
  TextStyle get textLgBold => textLg.copyWith(fontWeight: TextValues.bold);

  /// Text Medium - 16px
  TextStyle get textMd => TextValues.style.copyWith(
    fontSize: TextValues.textMd,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Text Medium Semibold
  TextStyle get textMdSemibold =>
      textMd.copyWith(fontWeight: TextValues.semibold);

  /// Text Medium Bold
  TextStyle get textMdBold => textMd.copyWith(fontWeight: TextValues.bold);

  /// Text Small - 14px
  TextStyle get textSm => TextValues.style.copyWith(
    fontSize: TextValues.textSm,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Text Small Semibold
  TextStyle get textSmSemibold =>
      textSm.copyWith(fontWeight: TextValues.semibold);

  /// Text Small Bold
  TextStyle get textSmBold => textSm.copyWith(fontWeight: TextValues.bold);

  /// Text XS - 12px
  TextStyle get textXs => TextValues.style.copyWith(
    fontSize: TextValues.textXs,
    fontWeight: TextValues.regular,
    color: ColorValues.textPrimary(_context),
  );

  /// Text XS Semibold
  TextStyle get textXsSemibold =>
      textXs.copyWith(fontWeight: TextValues.semibold);

  /// Text XS Bold
  TextStyle get textXsBold => textXs.copyWith(fontWeight: TextValues.bold);

  // ===========================================================================
  // SPECIAL STYLES
  // ===========================================================================

  /// Page title style - used in app bars
  TextStyle get pageTitle => displayXsSemibold;

  /// Section title
  TextStyle get sectionTitle => textLgSemibold;

  /// Card title
  TextStyle get cardTitle => textSmBold;

  /// Body text
  TextStyle get body => textMd;

  /// Caption text
  TextStyle get caption => textXs;

  /// Button text
  TextStyle get button => textMdSemibold;
}
