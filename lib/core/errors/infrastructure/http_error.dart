import 'package:rick_and_morty/core/foundation.dart';

class HttpError extends ServerError {
  const HttpError([String? message]) : super(message: message);

  /// Create a [HttpError] from an exception `e`.
  ///
  /// This factory will evaluate if the exception is a [HttpException], in
  /// which case it will add the linked message to the returned HttpError
  /// instance.
  factory HttpError.fromException(Object e, [StackTrace? stackTrace]) {
    const name = '$_source.fromException';

    log('❌ Unknown exception', error: e, stackTrace: stackTrace, name: name);
    return const HttpError();
  }

  static const String _source = 'HttpError';
}
