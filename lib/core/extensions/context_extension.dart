import 'package:rick_and_morty/core/theme/extended_text_theme.dart';
import 'package:rick_and_morty/core/ui.dart';

/// A set of extensions for [BuildContext] objects.
extension ContextExtensions on BuildContext {
  /// Returns the [ThemeData] of the current context.
  ThemeData get theme => Theme.of(this);

  /// Returns the [MediaQueryData] of the current context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Return the top safe space of the current device.
  double get topSafeSpace => mediaQuery.padding.top;

  /// Return the bottom safe space of the current device.
  double get bottomSafeSpace => mediaQuery.padding.bottom;

  /// Returns the screen width.
  double get screenWidth => mediaQuery.size.width;

  /// Returns the screen height.
  double get screenHeight => mediaQuery.size.height;

  /// Returns the full route path of the child route you want to navigate to.
  String getFullRoutePath(String childRoutePath) =>
      GoRouter.of(this).state.matchedLocation + childRoutePath;

  /// This method returns the current route of the app.
  String get currentRoute => GoRouterState.of(this).uri.toString();

  /// Returns the text theme of the current context.
  TextTheme get textTheme => TextTheme.of(this);

  /// Returns custom app text styles.
  ///
  /// Usage:
  /// ```dart
  /// Text('Hello', style: context.appTextStyles.display2xl);
  /// Text('Title', style: context.appTextStyles.textLgSemibold);
  /// ```
  AppTextStyles get appTextStyles => AppTextStyles(this);
}
