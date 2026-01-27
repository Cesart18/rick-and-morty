// ignore_for_file: lines_longer_than_80_chars

import 'package:rick_and_morty/core/foundation.dart';

/// {@template server_error}
/// Error that occurs in the infrastructure layer (HTTP, Dio, etc.)
/// {@endtemplate}
class ServerError extends BaseError {
  const ServerError({
    this.statusCode,
    this.message,
    this.type = ServerErrorType.unknown,
  });

  /// HTTP status code (when applicable)
  final int? statusCode;

  /// Error message returned by the server
  final String? message;

  /// Type of server error
  final ServerErrorType type;

  @override
  String toString() {
    return 'ServerError(type: $type, statusCode: $statusCode, message: $message)';
  }
}

/// Server error types
enum ServerErrorType {
  /// Network/connection error
  network,

  /// Timeout
  timeout,

  /// Server error (5xx)
  server,

  /// Unauthorized (401)
  unauthorized,

  /// Not found (404)
  notFound,

  /// Validation error (400)
  badRequest,

  /// Unknown error
  unknown,
}
