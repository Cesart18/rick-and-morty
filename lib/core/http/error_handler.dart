// ignore_for_file: strict_raw_type

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/foundation.dart';

/// {@template error_handler}
/// Handles converting Dio errors to ServerError
/// {@endtemplate}
class ErrorHandler {
  const ErrorHandler();

  /// Converts a DioException to a ServerError
  ServerError handle(DioException exception) {
    return switch (exception.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout ||
      DioExceptionType.sendTimeout => _timeoutError(),
      DioExceptionType.connectionError => _connectionError(),
      DioExceptionType.badResponse => _badResponseError(exception.response),
      DioExceptionType.cancel => _cancelError(),
      DioExceptionType.badCertificate => _certificateError(),
      DioExceptionType.unknown => _unknownError(exception.message),
    };
  }

  ServerError _timeoutError() {
    return const ServerError(
      type: ServerErrorType.timeout,
      message: 'La solicitud tardó demasiado tiempo',
    );
  }

  ServerError _connectionError() {
    return const ServerError(
      type: ServerErrorType.network,
      message: 'No se pudo conectar al servidor',
    );
  }

  ServerError _badResponseError(Response? response) {
    final statusCode = response?.statusCode;
    final message = _extractMessage(response?.data as DataMap? ?? {});

    return switch (statusCode) {
      400 => ServerError(
        type: ServerErrorType.badRequest,
        statusCode: statusCode,
        message: message ?? 'Solicitud inválida',
      ),
      401 => ServerError(
        type: ServerErrorType.unauthorized,
        statusCode: statusCode,
        message: message ?? 'No autorizado',
      ),
      404 => ServerError(
        type: ServerErrorType.notFound,
        statusCode: statusCode,
        message: message ?? 'Recurso no encontrado',
      ),
      final code? when code >= 500 => ServerError(
        type: ServerErrorType.server,
        statusCode: statusCode,
        message: message ?? 'Error del servidor',
      ),
      _ => ServerError(
        statusCode: statusCode,
        message: message ?? 'Error desconocido',
      ),
    };
  }

  ServerError _cancelError() {
    return const ServerError(message: 'Request cancelled');
  }

  ServerError _certificateError() {
    return const ServerError(
      type: ServerErrorType.network,
      message: 'Error de certificado SSL',
    );
  }

  ServerError _unknownError(String? message) {
    return ServerError(message: message ?? 'Error desconocido');
  }

  String? _extractMessage(DataMap data) {
    return switch (data) {
      final DataMap map =>
        map['message'] as String? ??
            map['error'] as String? ??
            map['detail'] as String? ??
            map['error_description'] as String?,
    };
  }
}
