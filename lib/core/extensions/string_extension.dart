/// A set of extensions for [String] objects.
extension StringExtension on String {
  /// Capitalizes the first letter of the string.
  String get capitalize => substring(0, 1).toUpperCase() + substring(1);
}
