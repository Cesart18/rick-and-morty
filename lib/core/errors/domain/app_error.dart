import 'package:rick_and_morty/core/foundation.dart';

const _defaultMessage = 'An error occurred';

class AppError extends BaseError implements Exception {
  const AppError([String? message]) : message = message ?? _defaultMessage;

  /// Create a [AppError] from a [ServerError], extracting the `message` field
  /// from it.
  factory AppError.fromServerError(ServerError e) {
    return AppError(e.message);
  }

  final String? message;
}

/// {@template bad_state_error}
/// This error represents an internal bad state in the application.
///
/// It should be handled differently in the presentation layer to avoid exposing
/// the error message to the user.
/// {@endtemplate}
class BadStateError extends AppError {
  /// {@macro bad_state_error}
  const BadStateError([String? message]) : super('Bad state: $message');
}
